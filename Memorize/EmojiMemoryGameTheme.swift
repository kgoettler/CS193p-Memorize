//
//  EmojiMemoryGameTheme.swift
//  Memorize
//
//  Created by Ken Goettler on 4/5/21.
//

import SwiftUI

struct EmojiMemoryGameTheme: Codable {
    var name: String
    var emojis: [String]
    var color: UIColor.RGB
    
    var numberOfPairs: Int {
        self.emojis.count
    }
    
    func printJSON() {
        let jsonData = try! JSONEncoder().encode(self)
        let jsonString = String(data: jsonData, encoding: .utf8)!
        print(jsonString)
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
            return EmojiMemoryGameTheme(
                name: self.rawValue,
                emojis: ["👻", "🎃", "🕷", "🦴", "💀"],
                color: UIColor.RGB(
                    red: CGFloat(1),
                    green: CGFloat(0.647),
                    blue: CGFloat(0),
                    alpha: CGFloat(1)
                )
            )
        case .flags:
            return EmojiMemoryGameTheme(
                name: self.rawValue,
                emojis: ["🇺🇸", "🇨🇦", "🇬🇧", "🇮🇪", "🇫🇷"],
                color: UIColor.RGB(
                    red: CGFloat(0),
                    green: CGFloat(0),
                    blue: CGFloat(1),
                    alpha: CGFloat(1)
                )
            )
        case .numbers:
            return EmojiMemoryGameTheme(
                name: self.rawValue,
                emojis: ["1️⃣", "2️⃣", "3️⃣", "4️⃣", "5️⃣"],
                color: UIColor.RGB(
                    red: CGFloat(0),
                    green: CGFloat(0),
                    blue: CGFloat(1),
                    alpha: CGFloat(1)
                )            )
        case .smileys:
            return EmojiMemoryGameTheme(
                name: self.rawValue,
                emojis: ["🙂", "😊", "☺️", "🥰", "😘"],
                color: UIColor.RGB(
                    red: CGFloat(0),
                    green: CGFloat(0),
                    blue: CGFloat(1),
                    alpha: CGFloat(1)
                )            )
        case .mammals:
            return EmojiMemoryGameTheme(
                name: self.rawValue,
                emojis: ["🐶", "🐱", "🐯", "🦁", "🐨"],
                color: UIColor.RGB(
                    red: CGFloat(0),
                    green: CGFloat(0),
                    blue: CGFloat(1),
                    alpha: CGFloat(1)
                )
            )
        case .ocean:
            return EmojiMemoryGameTheme(
                name: self.rawValue,
                emojis: ["🐳", "🐙", "🐬", "🐋", "🐠"],
                color: UIColor.RGB(
                    red: CGFloat(0),
                    green: CGFloat(0),
                    blue: CGFloat(1),
                    alpha: CGFloat(1)
                )            )
        }
    }
    
    static func getRandomTheme() -> EmojiMemoryGameTheme {
        EmojiMemoryGameThemes.allCases.randomElement()!.getTheme()
    }
}
