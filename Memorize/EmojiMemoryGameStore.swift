//
//  EmojiMemoryGameStore.swift
//  Memorize
//
//  Created by Ken Goettler on 7/11/21.
//

import Foundation
import Combine

class EmojiMemoryGameStore: ObservableObject {
        
    @Published var themes = EmojiMemoryGameThemes.allCases.map { $0.getTheme() }
    private var autosave: AnyCancellable?
    
    init() {
        let defaultsKey = "EmojiMemoryGameStore.themes"
//        themes = UserDefaults.standard.object(forKey: defaultsKey) as! [EmojiMemoryGameTheme]
//        if themes.count == 0 {
//            themes = EmojiMemoryGameThemes.allCases.map { $0.getTheme() }
//        }
//        autosave = $themes.sink { themes in
//            UserDefaults.standard.set(themes, forKey: defaultsKey)
//        }
    }
    
    func addTheme(named name: String = "Untitled") {
        themes.append(EmojiMemoryGameTheme.createNewTheme(named: name))
    }
    
    func removeTheme(_ theme: EmojiMemoryGameTheme) {
        if let idx = getThemeIndex(theme) {
            themes.remove(at: idx)
        }
    }
    
    func removeEmoji(_ emoji: String, from theme: EmojiMemoryGameTheme) -> EmojiMemoryGameTheme? {
        if let idx = getThemeIndex(theme), let emojiIdx = themes[idx].emojis.firstIndex(of: emoji) {
            themes[idx].emojis.remove(at: emojiIdx)
            themes[idx].numberOfPairs -= 1
            return themes[idx]
        }
        return nil
    }
    
    func getThemeIndex(_ theme: EmojiMemoryGameTheme) -> Int? {
        return themes.firstIndex(matching: theme)
    }
}
