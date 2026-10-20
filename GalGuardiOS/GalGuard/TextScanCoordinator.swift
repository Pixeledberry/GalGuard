import UIKit
import VisionKit
import Vision

/// Apple's document camera (auto-crops the page), then Apple's on-device text recognition.
/// Returns the recognized text, one line per row, to the web page.
final class TextScanCoordinator: NSObject, VNDocumentCameraViewControllerDelegate {
    private var completion: ((String?, String?) -> Void)?
    private var languages: [String] = ["en-US"]

    func start(from host: UIViewController, lang: String, completion: @escaping (String?, String?) -> Void) {
        guard VNDocumentCameraViewController.isSupported else { completion(nil, "document camera not supported"); return }
        self.completion = completion
        let map = ["eng": "en-US", "deu": "de-DE", "fra": "fr-FR", "spa": "es-ES", "ita": "it-IT"]
        languages = [map[lang] ?? "en-US"]
        let vc = VNDocumentCameraViewController()
        vc.delegate = self
        host.present(vc, animated: true)
    }

    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        controller.dismiss(animated: true) { self.completion?(nil, nil) }
    }

    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
        controller.dismiss(animated: true) { self.completion?(nil, error.localizedDescription) }
    }

    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        controller.dismiss(animated: true) {
            DispatchQueue.global(qos: .userInitiated).async {
                var pages: [String] = []
                for i in 0..<scan.pageCount {
                    guard let cg = scan.imageOfPage(at: i).cgImage else { continue }
                    let request = VNRecognizeTextRequest()
                    request.recognitionLevel = .accurate
                    request.usesLanguageCorrection = true
                    let supported = (try? request.supportedRecognitionLanguages()) ?? []
                    let wanted = self.languages.filter { supported.contains($0) }
                    if !wanted.isEmpty { request.recognitionLanguages = wanted }
                    try? VNImageRequestHandler(cgImage: cg, options: [:]).perform([request])
                    let lines = (request.results ?? []).compactMap { $0.topCandidates(1).first?.string }
                    pages.append(lines.joined(separator: "\n"))
                }
                DispatchQueue.main.async { self.completion?(pages.joined(separator: "\n"), nil) }
            }
        }
    }
}
