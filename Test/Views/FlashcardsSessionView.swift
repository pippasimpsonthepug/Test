import SwiftUI

struct FlashcardsSessionView: View {
    let deck: Deck
    let cards: [CardItem]
    let onComplete: (SessionResult) -> Void

    @State private var index = 0
    @State private var showTranslation = false
    @State private var score = 0
    @State private var streak = 0
    @State private var bestStreak = 0
    @State private var correct = 0
    @State private var notSure = 0
    @State private var incorrect = 0
    @State private var incorrectItems: [CardItem] = []
    @State private var notSureItems: [CardItem] = []

    var body: some View {
        VStack(spacing: 16) {
            progressHeader

            Spacer()

            cardView
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        showTranslation.toggle()
                    }
                }

            Spacer()

            if showTranslation {
                actionButtons
            } else {
                Text("Tap to reveal the English translation")
                    .font(Theme.font(.footnote))
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
    }

    private var progressHeader: some View {
        HStack {
            Text("Card \(index + 1)/\(cards.count)")
                .font(Theme.font(.subheadline))
                .foregroundStyle(.secondary)
            Spacer()
            VStack(alignment: .trailing) {
                Text("Score \(score)")
                    .font(Theme.font(.subheadline))
                Text("Streak \(streak)")
                    .font(Theme.font(.caption))
                    .foregroundStyle(.secondary)
            }
        }
    }

    private var cardView: some View {
        Theme.card {
            VStack(spacing: 12) {
                Text(cards[index].spanish)
                    .font(Theme.font(.title))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                if showTranslation {
                    Text(cards[index].english)
                        .font(Theme.font(.title3))
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }

    private var actionButtons: some View {
        VStack(spacing: 12) {
            Button("Knew it") {
                handleAnswer(.correct)
            }
            .buttonStyle(Theme.PrimaryButtonStyle())

            Button("Not sure") {
                handleAnswer(.notSure)
            }
            .buttonStyle(.bordered)

            Button("Didn't know") {
                handleAnswer(.incorrect)
            }
            .buttonStyle(.bordered)
        }
    }

    private func handleAnswer(_ outcome: AnswerOutcome) {
        let card = cards[index]
        switch outcome {
        case .correct:
            correct += 1
            score += 10
            streak += 1
            bestStreak = max(bestStreak, streak)
        case .notSure:
            notSure += 1
            score += 5
            streak = 0
            notSureItems.append(card)
        case .incorrect:
            incorrect += 1
            streak = 0
            incorrectItems.append(card)
        }

        if index + 1 < cards.count {
            index += 1
            showTranslation = false
        } else {
            finishSession()
        }
    }

    private func finishSession() {
        let total = cards.count
        let accuracy = total > 0 ? Double(correct) / Double(total) : 0
        let result = SessionResult(
            id: UUID(),
            deckId: deck.id,
            deckName: deck.name,
            mode: .flashcards,
            total: total,
            correct: correct,
            notSure: notSure,
            incorrect: incorrect,
            accuracy: accuracy,
            bestStreak: bestStreak,
            score: score,
            date: Date(),
            incorrectItems: incorrectItems,
            notSureItems: notSureItems
        )
        onComplete(result)
    }
}

private enum AnswerOutcome {
    case correct
    case notSure
    case incorrect
}
