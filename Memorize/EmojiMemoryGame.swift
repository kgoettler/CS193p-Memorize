//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ken Goettler on 4/3/21.
//

import SwiftUI

class EmojiMemoryGame {
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["🐯", "👻", "🥰", "😘", "🍑"]
        let num = Int.random(in: 2...5)
        return MemoryGame<String>(numberOfPairsOfCards: num) { pairIndex in
            return emojis[pairIndex]
        }
    }
    // Mark - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // Mark - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
