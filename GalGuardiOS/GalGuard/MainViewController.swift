import UIKit
import WebKit
import AVFoundation

/// Serves the bundled page from galguard://app/ so favorites and settings keep a stable storage origin.
final class SchemeHandler: NSObject, WKURLSchemeHandler {
    func webView(_ webView: WKWebView, start task: WKURLSchemeTask) {
        guard let url = task.request.url else { return }
        var name = url.lastPathComponent
        if name.isEmpty || name == "/" { name = "galguard.html" }
        let base = (name as NSString).deletingPathExtension
        let ext = (name as NSString).pathExtension
        guard let file = Bundle.main.url(forResource: base, withExtension: ext),
              let data = try? Data(contentsOf: file) else {
            task.didFailWithError(URLError(.fileDoesNotExist)); return
        }
        let types = ["html": "text/html", "png": "image/png", "svg": "image/svg+xml"]
        let headers = ["Content-Type": (types[ext] ?? "application/octet-stream") + "; charset=utf-8",
                       "Content-Length": "\(data.count)"]
        let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: headers)!
        task.didReceive(response)
        task.didReceive(data)
        task.didFinish()
    }
    func webView(_ webView: WKWebView, stop task: WKURLSchemeTask) {}
}

final class MainViewController: UIViewController, WKScriptMessageHandler, WKNavigationDelegate, WKUIDelegate {
    private var web: WKWebView!
    private var scanner: AnyObject?   // ScanCoordinator on iOS 16+
    private var textScanner: TextScanCoordinator?

    override func loadView() {
        let config = WKWebViewConfiguration()
        config.setURLSchemeHandler(SchemeHandler(), forURLScheme: "galguard")
        config.allowsInlineMediaPlayback = true
        let controller = WKUserContentController()
        controller.add(self, name: "ios")
        // The page already knows how to talk to a native "Android" bridge, so we give it the same shape.
        let shim = "window.Android={scan:function(){window.webkit.messageHandlers.ios.postMessage({a:'scan'})},share:function(t){window.webkit.messageHandlers.ios.postMessage({a:'share',t:t})},scanText:function(l){window.webkit.messageHandlers.ios.postMessage({a:'scanText',l:l})}};"
        controller.addUserScript(WKUserScript(source: shim, injectionTime: .atDocumentStart, forMainFrameOnly: true))
        config.userContentController = controller
        web = WKWebView(frame: .zero, configuration: config)
        web.navigationDelegate = self
        web.uiDelegate = self
        web.scrollView.contentInsetAdjustmentBehavior = .never   // the page handles safe areas itself
        view = web
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        web.load(URLRequest(url: URL(string: "galguard://app/galguard.html")!))
    }

    func userContentController(_ c: WKUserContentController, didReceive message: WKScriptMessage) {
        guard let body = message.body as? [String: Any], let action = body["a"] as? String else { return }
        if action == "scan" { startScan() }
        if action == "scanText" { startTextScan(body["l"] as? String ?? "eng") }
        if action == "share", let text = body["t"] as? String {
            let sheet = UIActivityViewController(activityItems: [text], applicationActivities: nil)
            sheet.popoverPresentationController?.sourceView = view
            present(sheet, animated: true)
        }
    }

    private func js(_ function: String, _ value: String) {
        let data = (try? JSONEncoder().encode(value)) ?? Data("\"\"".utf8)
        let quoted = String(data: data, encoding: .utf8) ?? "\"\""
        web.evaluateJavaScript("window.\(function) && window.\(function)(\(quoted))")
    }

    private func startScan() {
        guard #available(iOS 16.0, *) else { js("onNativeScanError", "needs iOS 16"); return }
        AVCaptureDevice.requestAccess(for: .video) { granted in
            DispatchQueue.main.async {
                guard granted else { self.js("onNativeScanError", "camera access denied"); return }
                let coordinator = ScanCoordinator()
                self.scanner = coordinator
                coordinator.start(from: self) { [weak self] result in
                    self?.scanner = nil
                    if let value = result { self?.js("onNativeScan", value) }
                }
            }
        }
    }

    private func startTextScan(_ lang: String) {
        let coordinator = TextScanCoordinator()
        textScanner = coordinator
        coordinator.start(from: self, lang: lang) { [weak self] text, error in
            self?.textScanner = nil
            if let error = error { self?.js("onNativeTextError", error) }
            else if let text = text { self?.js("onNativeText", text) }
        }
    }

    // Camera for the page's own fallback scanner (iOS 15)
    @available(iOS 15.0, *)
    func webView(_ webView: WKWebView, requestMediaCapturePermissionFor origin: WKSecurityOrigin,
                 initiatedByFrame frame: WKFrameInfo, type: WKMediaCaptureType,
                 decisionHandler: @escaping (WKPermissionDecision) -> Void) { decisionHandler(.grant) }

    // Links to websites open in Safari
    func webView(_ webView: WKWebView, decidePolicyFor action: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let url = action.request.url, url.scheme == "http" || url.scheme == "https" {
            UIApplication.shared.open(url); decisionHandler(.cancel)
        } else { decisionHandler(.allow) }
    }
}
