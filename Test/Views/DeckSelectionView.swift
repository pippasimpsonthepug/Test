import SwiftUI

struct DeckSelectionView: View {
    @EnvironmentObject private var viewModel: AppViewModel

    var body: some View {
        Theme.card {
            List {
                Section("Decks") {
                    ForEach(viewModel.decks) { deck in
                        NavigationLink(value: deck) {
                            DeckRow(deck: deck, stats: viewModel.stats(for: deck))
                        }
                        .listRowBackground(Color.clear)
                    }
                }
                .listRowBackground(Color.clear)
            }
            .scrollContentBackground(.hidden)
            .listStyle(.plain)
            .background(Color.clear)
        }
        .padding()
        .navigationTitle("Spanish Flashcards")
    }
}

private struct DeckRow: View {
    let deck: Deck
    let stats: DeckStats

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(deck.name)
                .font(Theme.font(.headline))
            HStack(spacing: 12) {
                Label("\(deck.cards.count) cards", systemImage: "rectangle.stack")
                Text(bestAccuracyText)
                    .font(Theme.font(.subheadline))
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 4)
    }

    private var bestAccuracyText: String {
        guard stats.totalAttempts > 0 else { return "Best accuracy: --" }
        let percent = Int((stats.bestAccuracy * 100).rounded())
        return "Best accuracy: \(percent)%"
    }
}
