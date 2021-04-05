//
//  EmojiMemoryGameTheme.swift
//  Memorize
//
//  Created by Ken Goettler on 4/5/21.
//

import SwiftUI

struct EmojiMemoryGameTheme {
    var name: String
    var emojis: [String]
    var bgColor: Color
    var numberOfPairs: Int
    
    init(name: String, emojis: [String], bgColor: Color, numberOfPairsRandom: Bool = false) {
        self.name = name
        self.emojis = emojis
        self.bgColor = bgColor
        self.numberOfPairs = numberOfPairsRandom ? .random(in: 2...emojis.count) : emojis.count
    }
}

enum EmojiMemoryGameThemes: String, CaseIterable {
    case halloween
    case flags
    case numbers
    case smileys
    case mammals
    case ocean
    
    func getTheme() -> EmojiMemoryGameTheme {
        switch self{
        case .halloween:
            return EmojiMemoryGameTheme(name: self.rawValue, emojis: ["👻", "🎃", "🕷", "🦴", "💀"], bgColor: .orange, numberOfPairsRandom: true)
        case .flags:
            return EmojiMemoryGameTheme(name: self.rawValue, emojis: ["🇺🇸", "🇨🇦", "🇬🇧", "🇮🇪", "🇫🇷"], bgColor: .white)
        case .numbers:
            return EmojiMemoryGameTheme(name: self.rawValue, emojis: ["1️⃣", "2️⃣", "3️⃣", "4️⃣", "5️⃣"], bgColor: .white)
        case .smileys:
            return EmojiMemoryGameTheme(name: self.rawValue, emojis: ["🙂", "😊", "☺️", "🥰", "😘"], bgColor: .white)
        case .mammals:
            return EmojiMemoryGameTheme(name: self.rawValue, emojis: ["🐶", "🐱", "🐯", "🦁", "🐨"], bgColor: .white)
        case .ocean:
            return EmojiMemoryGameTheme(name: self.rawValue, emojis: ["🐳", "🐙", "🐬", "🐋", "🐠"], bgColor: .white)
        }
    }
    
    static func getRandomTheme() -> EmojiMemoryGameTheme {
        EmojiMemoryGameThemes.allCases.randomElement()!.getTheme()
    }
}
