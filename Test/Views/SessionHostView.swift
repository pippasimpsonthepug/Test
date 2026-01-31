import SwiftUI

struct SessionHostView: View {
    @EnvironmentObject private var viewModel: AppViewModel
    @Environment(\.dismiss) private var dismiss

    let config: SessionConfig
    private let cards: [CardItem]

    init(config: SessionConfig) {
        self.config = config
        if let overrideCards = config.overrideCards, !overrideCards.isEmpty {
            self.cards = overrideCards
        } else {
            self.cards = Array(config.deck.cards.shuffled().prefix(config.length))
        }
    }

    var body: some View {
        Group {
            if cards.isEmpty {
                Theme.card {
                    VStack(spacing: 12) {
                        Text("No cards available")
                            .font(Theme.font(.headline))
                        Text("Add cards to this deck before starting a session.")
                            .font(Theme.font(.subheadline))
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                        Button("Back to deck") {
                            dismiss()
                        }
                        .buttonStyle(Theme.PrimaryButtonStyle())
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                }
                .padding()
            } else {
                switch config.mode {
                case .flashcards:
                    FlashcardsSessionView(deck: config.deck, cards: cards) { result in
                        viewModel.completeSession(result)
                    }
                case .quiz:
                    QuizSessionView(deck: config.deck, cards: cards) { result in
                        viewModel.completeSession(result)
                    }
                }
            }
        }
        .navigationTitle(config.deck.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
