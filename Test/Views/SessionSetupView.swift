import SwiftUI

struct SessionSetupView: View {
    @EnvironmentObject private var viewModel: AppViewModel

    let deck: Deck

    @State private var mode: SessionMode = .flashcards
    @State private var selectedLength: Int

    init(deck: Deck) {
        self.deck = deck
        let options = SessionSetupView.lengthOptions(for: deck)
        _selectedLength = State(initialValue: options.first ?? deck.cards.count)
    }

    var body: some View {
        Theme.card {
            Form {
                Section("Mode") {
                    Picker("Mode", selection: $mode) {
                        ForEach(SessionMode.allCases) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .listRowBackground(Color.clear)

                Section("Session length") {
                    Picker("Length", selection: $selectedLength) {
                        ForEach(SessionSetupView.lengthOptions(for: deck), id: \.self) { length in
                            Text("\(length)")
                                .tag(length)
                        }
                    }
                    .pickerStyle(.segmented)
                    Text("Deck size: \(deck.cards.count)")
                        .font(Theme.font(.footnote))
                        .foregroundStyle(.secondary)
                }
                .listRowBackground(Color.clear)

                Section {
                    NavigationLink(value: SessionConfig(deck: deck, mode: mode, length: selectedLength, overrideCards: nil)) {
                        Text("Start session")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .buttonStyle(Theme.PrimaryButtonStyle())
                }
                .listRowBackground(Color.clear)
            }
            .scrollContentBackground(.hidden)
            .background(Color.clear)
        }
        .padding()
        .navigationTitle(deck.name)
    }

    private static func lengthOptions(for deck: Deck) -> [Int] {
        let base = [10, 20, 30]
        let capped = base.map { min($0, deck.cards.count) }
        let unique = Array(Set(capped)).sorted()
        return unique
    }
}
