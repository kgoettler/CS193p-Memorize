//
//  EmojiMemoryGameTheme.swift
//  Memorize
//
//  Created by Ken Goettler on 4/5/21.
//

import SwiftUI

enum EmojiMemoryGameTheme: String, CaseIterable {
    case halloween = "Halloween"
    case flags = "Flags"
    case numbers = "Numbers"
    case smileys = "Smileys"
    case mammals = "Mammals"
    case ocean = "Ocean"
    
    static func getRandomTheme() -> EmojiMemoryGameTheme {
        self.allCases.randomElement() ?? .halloween
    }
    
    var numberOfPairs: Int {
        self == .halloween ? .random(in: 2...5) : self.values.count
    }
    
    var values: [String] {
        switch self {
        case .halloween:
            return ["👻", "🎃", "🕷", "🦴", "💀"]
        case .flags:
            return ["🇺🇸", "🇨🇦", "🇬🇧", "🇮🇪", "🇫🇷"]
        case .numbers:
            return ["1️⃣", "2️⃣", "3️⃣", "4️⃣", "5️⃣"]
        case .smileys:
            return ["🙂", "😊", "☺️", "🥰", "😘"]
        case .mammals:
            return ["🐶", "🐱", "🐯", "🦁", "🐨"]
        case .ocean:
            return ["🐳", "🐙", "🐬", "🐋", "🐠"]
        }
    }
    
    var color: Color {
        switch self {
        case .halloween:
            return .orange
        case .ocean:
            return .blue
        default:
            return .white
        }
    }
}
