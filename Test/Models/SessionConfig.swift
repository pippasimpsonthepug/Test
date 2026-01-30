import Foundation

struct SessionConfig: Hashable {
    let deck: Deck
    let mode: SessionMode
    let length: Int
    let overrideCards: [CardItem]?
}
