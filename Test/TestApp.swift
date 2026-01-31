import SwiftUI

@main
struct TestApp: App {
    @StateObject private var viewModel = AppViewModel()

    var body: some Scene {
        WindowGroup {
            AppBackgroundView {
                ContentView()
                    .environmentObject(viewModel)
            }
            .environment(\.font, Theme.font(.body))
        }
    }
}
