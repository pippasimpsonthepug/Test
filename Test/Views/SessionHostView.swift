import SwiftUI

struct SessionHostView: View {
    @EnvironmentObject private var viewModel: AppViewModel

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
        .navigationTitle(config.deck.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
