import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var viewModel: AppViewModel

    var body: some View {
        NavigationStack(path: $viewModel.path) {
            DeckSelectionView()
                .navigationDestination(for: Deck.self) { deck in
                    SessionSetupView(deck: deck)
                }
                .navigationDestination(for: SessionConfig.self) { config in
                    SessionHostView(config: config)
                }
                .navigationDestination(for: SessionResult.self) { result in
                    SessionReportView(result: result)
                }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AppViewModel())
}
