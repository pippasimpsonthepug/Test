# Edexcel A-level Spanish Flashcards

A lightweight SwiftUI flashcards + quiz app for Edexcel A-level Spanish (UK MFL). It supports deck selection, session setup, flashcards, quizzes, and a session report with practice for mistakes.

## Features
- Six built-in decks for Themes 1.1, 1.2, 1.3, 2.2, 2.3, and Higher Level language.
- Two study modes: Flashcards and Quiz (MCQ).
- Session lengths of 10/20/30 (capped to deck size).
- End-of-session report with accuracy, streak, score, and lists of missed items.
- Practice mistakes flow using incorrect + not-sure items.
- Local persistence of deck stats and the last 10 sessions.

## Adding more vocab decks
1. Open `Test/Services/DeckLibrary.swift`.
2. Add a new `Deck` entry with a unique `id`, a `name`, and an array of `CardItem` pairs.
3. Keep the card list at 12+ items for a good mix in quizzes.

Example:
```swift
Deck(id: "theme3_1", name: "Theme 3.1 New Topic", cards: [
    CardItem(spanish: "el ejemplo", english: "the example"),
    CardItem(spanish: "otro término", english: "another term")
])
```
