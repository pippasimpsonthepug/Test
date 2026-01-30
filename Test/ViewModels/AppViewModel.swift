import Foundation
import SwiftUI

@MainActor
final class AppViewModel: ObservableObject {
    @Published var decks: [Deck] = DeckLibrary.decks
    @Published var deckStats: [String: DeckStats] = [:]
    @Published var recentSessions: [SessionResult] = []
    @Published var path = NavigationPath()

    private let store = DataStore.shared

    init() {
        deckStats = store.loadDeckStats()
        recentSessions = store.loadSessionResults()
    }

    func stats(for deck: Deck) -> DeckStats {
        deckStats[deck.id] ?? .empty
    }

    func completeSession(_ result: SessionResult) {
        updateDeckStats(with: result)
        appendSession(result)
        path.append(result)
    }

    func startPracticeSession(from result: SessionResult) {
        let cards = result.incorrectItems + result.notSureItems
        guard let deck = decks.first(where: { $0.id == result.deckId }) else { return }
        let config = SessionConfig(deck: deck, mode: result.mode, length: cards.count, overrideCards: cards)
        path.append(config)
    }

    private func updateDeckStats(with result: SessionResult) {
        var stats = deckStats[result.deckId] ?? .empty
        stats.totalAttempts += result.total
        stats.correct += result.correct
        stats.notSure += result.notSure
        stats.incorrect += result.incorrect
        let accuracy = stats.totalAttempts > 0 ? Double(stats.correct) / Double(stats.totalAttempts) : 0
        stats.bestAccuracy = max(stats.bestAccuracy, accuracy)
        stats.lastPlayed = result.date
        deckStats[result.deckId] = stats
        store.saveDeckStats(deckStats)
    }

    private func appendSession(_ result: SessionResult) {
        var updated = recentSessions
        updated.insert(result, at: 0)
        if updated.count > 10 {
            updated = Array(updated.prefix(10))
        }
        recentSessions = updated
        store.saveSessionResults(updated)
    }
}
