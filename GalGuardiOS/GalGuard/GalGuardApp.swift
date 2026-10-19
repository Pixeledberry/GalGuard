import SwiftUI

@main
struct GalGuardApp: App {
    var body: some Scene {
        WindowGroup {
            WebHost().ignoresSafeArea()
        }
    }
}

struct WebHost: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> MainViewController { MainViewController() }
    func updateUIViewController(_ vc: MainViewController, context: Context) {}
}
