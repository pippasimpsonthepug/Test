import Foundation

final class DataStore {
    static let shared = DataStore()

    private let deckStatsKey = "deckStats"
    private let sessionResultsKey = "sessionResults"
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let defaults = UserDefaults.standard

    private init() {
        encoder.dateEncodingStrategy = .iso8601
        decoder.dateDecodingStrategy = .iso8601
    }

    func loadDeckStats() -> [String: DeckStats] {
        guard let data = defaults.data(forKey: deckStatsKey) else { return [:] }
        return (try? decoder.decode([String: DeckStats].self, from: data)) ?? [:]
    }

    func saveDeckStats(_ stats: [String: DeckStats]) {
        guard let data = try? encoder.encode(stats) else { return }
        defaults.set(data, forKey: deckStatsKey)
    }

    func loadSessionResults() -> [SessionResult] {
        guard let data = defaults.data(forKey: sessionResultsKey) else { return [] }
        return (try? decoder.decode([SessionResult].self, from: data)) ?? []
    }

    func saveSessionResults(_ results: [SessionResult]) {
        guard let data = try? encoder.encode(results) else { return }
        defaults.set(data, forKey: sessionResultsKey)
    }
}
