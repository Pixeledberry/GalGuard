import UIKit
import VisionKit

/// Full-screen scanner for barcodes and QR codes. Reads from a distance (pinch to zoom),
/// waits a moment, then submits the code nearest the center of the screen.
@available(iOS 16.0, *)
final class ScanCoordinator: NSObject, DataScannerViewControllerDelegate {
    private var latest: [RecognizedItem] = []
    private var timer: Timer?
    private var finished = false
    private var completion: ((String?) -> Void)?
    private weak var scanner: DataScannerViewController?

    func start(from host: UIViewController, completion: @escaping (String?) -> Void) {
        guard DataScannerViewController.isSupported, DataScannerViewController.isAvailable else {
            completion(nil); return
        }
        self.completion = completion
        let s = DataScannerViewController(
            recognizedDataTypes: [.barcode(symbologies: [.ean13, .ean8, .upce, .code128, .code39, .qr])],
            qualityLevel: .accurate,
            recognizesMultipleItems: true,
            isHighFrameRateTrackingEnabled: true,
            isPinchToZoomEnabled: true,
            isGuidanceEnabled: true,
            isHighlightingEnabled: true)
        s.delegate = self
        s.modalPresentationStyle = .fullScreen
        scanner = s

        let cancel = UIButton(type: .system, primaryAction: UIAction(title: "Cancel") { [weak self] _ in self?.finish(nil) })
        cancel.setTitle("Cancel", for: .normal)
        cancel.tintColor = .white
        cancel.backgroundColor = UIColor.black.withAlphaComponent(0.55)
        cancel.layer.cornerRadius = 18
        cancel.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        cancel.translatesAutoresizingMaskIntoConstraints = false
        s.overlayContainerView.addSubview(cancel)
        NSLayoutConstraint.activate([
            cancel.topAnchor.constraint(equalTo: s.view.safeAreaLayoutGuide.topAnchor, constant: 12),
            cancel.leadingAnchor.constraint(equalTo: s.view.safeAreaLayoutGuide.leadingAnchor, constant: 16)])

        host.present(s, animated: true) { try? s.startScanning() }
    }

    private func finish(_ value: String?) {
        guard !finished else { return }
        finished = true
        timer?.invalidate()
        scanner?.stopScanning()
        scanner?.dismiss(animated: true) { [completion] in completion?(value) }
    }

    private func track(_ items: [RecognizedItem]) {
        latest = items
        guard timer == nil, !items.isEmpty, !finished else { return }
        timer = Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false) { [weak self] _ in self?.pick() }
    }

    private func pick() {
        timer = nil
        guard let view = scanner?.view else { return }
        let c = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        let product = try? NSRegularExpression(pattern: "\\d{8,14}")
        var candidates: [(value: String, isProduct: Bool, distance: CGFloat)] = []
        for item in latest {
            guard case .barcode(let code) = item, let value = code.payloadStringValue else { continue }
            let b = item.bounds
            let x = (b.topLeft.x + b.topRight.x + b.bottomLeft.x + b.bottomRight.x) / 4
            let y = (b.topLeft.y + b.topRight.y + b.bottomLeft.y + b.bottomRight.y) / 4
            let isProduct = product?.firstMatch(in: value, range: NSRange(value.startIndex..., in: value)) != nil
            candidates.append((value, isProduct, hypot(x - c.x, y - c.y)))
        }
        // product barcodes first, then whichever is closest to the middle of the screen
        let best = candidates.sorted { $0.isProduct != $1.isProduct ? $0.isProduct : $0.distance < $1.distance }.first
        if let best = best { finish(best.value) }
    }

    func dataScanner(_ d: DataScannerViewController, didAdd added: [RecognizedItem], allItems: [RecognizedItem]) { track(allItems) }
    func dataScanner(_ d: DataScannerViewController, didUpdate updated: [RecognizedItem], allItems: [RecognizedItem]) { track(allItems) }
    func dataScanner(_ d: DataScannerViewController, didRemove removed: [RecognizedItem], allItems: [RecognizedItem]) { latest = allItems }
}
