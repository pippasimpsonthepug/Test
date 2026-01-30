import Foundation

struct DeckStats: Codable, Hashable {
    var totalAttempts: Int
    var correct: Int
    var notSure: Int
    var incorrect: Int
    var bestAccuracy: Double
    var lastPlayed: Date?

    static let empty = DeckStats(totalAttempts: 0, correct: 0, notSure: 0, incorrect: 0, bestAccuracy: 0, lastPlayed: nil)
}
