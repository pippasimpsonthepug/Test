import Foundation

struct Deck: Identifiable, Codable, Hashable {
    let id: String
    let name: String
    let cards: [CardItem]
}
