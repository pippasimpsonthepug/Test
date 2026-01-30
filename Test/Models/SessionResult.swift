import Foundation

struct SessionResult: Identifiable, Codable, Hashable {
    let id: UUID
    let deckId: String
    let deckName: String
    let mode: SessionMode
    let total: Int
    let correct: Int
    let notSure: Int
    let incorrect: Int
    let accuracy: Double
    let bestStreak: Int
    let score: Int
    let date: Date
    let incorrectItems: [CardItem]
    let notSureItems: [CardItem]
}
