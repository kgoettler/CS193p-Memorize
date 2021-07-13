//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ken Goettler on 4/3/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String>
    private var theme: EmojiMemoryGameTheme
    
    init(theme: EmojiMemoryGameTheme) {
        self.model = MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairs) { pairIndex in
            return theme.emojis[pairIndex]
        }
        self.theme = theme
    }
    
    convenience init() {
        self.init(theme: EmojiMemoryGameThemes.getRandomTheme())
    }
    
    func createNewGame() {
        theme = self.refreshTheme()
        model = self.refreshMemoryGame()
    }

    private func refreshTheme() -> EmojiMemoryGameTheme {
        let theme = EmojiMemoryGameThemes.getRandomTheme()
        theme.printJSON()
        return theme
    }
    
    private func refreshMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairs) { pairIndex in
            return theme.emojis[pairIndex]
        }
    }
    
    // Mark - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var themeName: String {
        self.theme.name
    }
    
    var themeColor: Color {
        Color(theme.color)
    }
    
    var score: Int {
        self.model.score
    }
    
    // Mark - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
