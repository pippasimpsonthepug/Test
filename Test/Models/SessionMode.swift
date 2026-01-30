import Foundation

enum SessionMode: String, Codable, CaseIterable, Identifiable {
    case flashcards = "Flashcards"
    case quiz = "Quiz"

    var id: String { rawValue }
}
