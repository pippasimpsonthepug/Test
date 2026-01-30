import SwiftUI

struct SessionReportView: View {
    @EnvironmentObject private var viewModel: AppViewModel
    let result: SessionResult

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                summaryCard

                if !result.incorrectItems.isEmpty {
                    itemsSection(title: "Incorrect", items: result.incorrectItems)
                }

                if !result.notSureItems.isEmpty {
                    itemsSection(title: "Not sure", items: result.notSureItems)
                }

                if hasPracticeItems {
                    Button("Practice mistakes") {
                        viewModel.startPracticeSession(from: result)
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .padding()
        }
        .navigationTitle("Session report")
    }

    private var summaryCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(result.deckName)
                .font(.headline)
            Text("Mode: \(result.mode.rawValue)")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Divider()

            summaryRow(label: "Total", value: "\(result.total)")
            summaryRow(label: "Correct", value: "\(result.correct)")
            summaryRow(label: "Not sure", value: "\(result.notSure)")
            summaryRow(label: "Incorrect", value: "\(result.incorrect)")
            summaryRow(label: "Accuracy", value: "\(accuracyText)")
            summaryRow(label: "Best streak", value: "\(result.bestStreak)")
            summaryRow(label: "Score", value: "\(result.score)")
        }
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    private func summaryRow(label: String, value: String) -> some View {
        HStack {
            Text(label)
            Spacer()
            Text(value)
                .fontWeight(.semibold)
        }
        .font(.subheadline)
    }

    private func itemsSection(title: String, items: [CardItem]) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
            ForEach(items, id: \.id) { item in
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.spanish)
                        .fontWeight(.semibold)
                    Text(item.english)
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 4)
            }
        }
    }

    private var accuracyText: String {
        let percent = Int((result.accuracy * 100).rounded())
        return "\(percent)%"
    }

    private var hasPracticeItems: Bool {
        !result.incorrectItems.isEmpty || !result.notSureItems.isEmpty
    }
}
