import SwiftUI

struct QuizSessionView: View {
    let deck: Deck
    let cards: [CardItem]
    let onComplete: (SessionResult) -> Void

    @State private var index = 0
    @State private var score = 0
    @State private var streak = 0
    @State private var bestStreak = 0
    @State private var correct = 0
    @State private var incorrect = 0
    @State private var incorrectItems: [CardItem] = []
    @State private var options: [String] = []
    @State private var selectedOption: String? = nil
    @State private var showFeedback = false

    var body: some View {
        VStack(spacing: 16) {
            progressHeader

            Spacer()

            Theme.card {
                Text(cards[index].spanish)
                    .font(Theme.font(.title))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
            }

            VStack(spacing: 12) {
                ForEach(options, id: \.self) { option in
                    Button {
                        handleSelection(option)
                    } label: {
                        Text(option)
                            .font(Theme.font(.body))
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)
                    .disabled(showFeedback)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(borderColor(for: option), lineWidth: 2)
                    )
                }
            }

            if showFeedback {
                Text(feedbackText)
                    .font(Theme.font(.headline))
                    .foregroundStyle(feedbackColor)

                Button("Next") {
                    moveNext()
                }
                .buttonStyle(Theme.PrimaryButtonStyle())
            }

            Spacer()
        }
        .padding()
        .onAppear(perform: loadOptions)
    }

    private var progressHeader: some View {
        HStack {
            Text("Question \(index + 1)/\(cards.count)")
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

    private var correctAnswer: String {
        cards[index].english
    }

    private var feedbackText: String {
        selectedOption == correctAnswer ? "Correct" : "Incorrect"
    }

    private var feedbackColor: Color {
        selectedOption == correctAnswer ? .green : .red
    }

    private func borderColor(for option: String) -> Color {
        guard showFeedback else { return .clear }
        if option == correctAnswer {
            return .green
        }
        if option == selectedOption {
            return .red
        }
        return .clear
    }

    private func loadOptions() {
        let currentCard = cards[index]
        var choices = deck.cards.filter { $0.id != currentCard.id }.shuffled().prefix(3).map { $0.english }
        choices.append(currentCard.english)
        options = choices.shuffled()
        selectedOption = nil
        showFeedback = false
    }

    private func handleSelection(_ option: String) {
        guard !showFeedback else { return }
        selectedOption = option
        showFeedback = true

        if option == correctAnswer {
            correct += 1
            score += 10
            streak += 1
            bestStreak = max(bestStreak, streak)
        } else {
            incorrect += 1
            streak = 0
            incorrectItems.append(cards[index])
        }
    }

    private func moveNext() {
        if index + 1 < cards.count {
            index += 1
            loadOptions()
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
            mode: .quiz,
            total: total,
            correct: correct,
            notSure: 0,
            incorrect: incorrect,
            accuracy: accuracy,
            bestStreak: bestStreak,
            score: score,
            date: Date(),
            incorrectItems: incorrectItems,
            notSureItems: []
        )
        onComplete(result)
    }
}
