//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Ken Goettler on 4/3/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let store = EmojiMemoryGameStore()
    //let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameChooser()
                .environmentObject(store)
            //EmojiMemoryGameView(viewModel: game)
        }
    }
}
