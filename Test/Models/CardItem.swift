import Foundation

struct CardItem: Identifiable, Codable, Hashable {
    let id: UUID
    let spanish: String
    let english: String

    init(id: UUID = UUID(), spanish: String, english: String) {
        self.id = id
        self.spanish = spanish
        self.english = english
    }
}
