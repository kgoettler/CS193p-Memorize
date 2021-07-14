//
//  ThemeEditor.swift
//  Memorize
//
//  Created by Ken Goettler on 7/12/21.
//

import SwiftUI

struct ThemeEditor: View {
    @EnvironmentObject var store: EmojiMemoryGameStore
    @Binding var chosenTheme: EmojiMemoryGameTheme
    @Binding var isShowing: Bool
    
    @State private var themeName: String = ""
    @State private var emojisToAdd: String = ""
    @State private var numberOfPairs: Int = 0
    
    var body: some View {
        VStack (spacing: 0) {
            ZStack {
                Text("Theme Editor")
                    .font(.headline)
                    .padding()
                HStack {
                    Spacer()
                    Button(action: {
                        self.save()
                        self.isShowing = false
                    }, label: { Text("Done") }).padding()
                }
            }
            Divider()
            Form {
                Section(header: Text("Theme Name")) {
                    TextField("Theme Name", text: $chosenTheme.name)
                }
                Section(header: Text("Emojis")) {
                    GridEmoji(self.chosenTheme.emojis.map { String($0) }, id: \.self ) { emoji in
                        Text(emoji).font(Font.system(size: 40))
                            .onTapGesture {
                                self.chosenTheme = self.store.removeEmoji(emoji, from: chosenTheme)!
                                if numberOfPairs > chosenTheme.emojis.count {
                                    numberOfPairs = chosenTheme.emojis.count
                                }
                            }
                    }
                }
                Section(header: Text("Card Count")) {
                    Stepper(value: $numberOfPairs, in: 1...(chosenTheme.emojis.count), label: {
                        Text("\(numberOfPairs) Cards")
                    }
                    )
                }
            }
        }
    }
    
    private func save() {
        
        // save the name
        self.chosenTheme.name = self.themeName
        
        // save the numbers of pairs of the game
        self.chosenTheme.numberOfPairs = self.numberOfPairs

        // find in store the theme being edited
        if let index = self.store.themes.firstIndex(matching: self.chosenTheme) {
            self.store.themes[index] = self.chosenTheme
        }
    }
}

struct ThemeEditor_Previews: PreviewProvider {
    static var previews: some View {
        let theme = EmojiMemoryGameTheme.createNewTheme(named: "Test")
        ThemeEditor(chosenTheme: Binding<EmojiMemoryGameTheme>.constant(theme), isShowing: Binding<Bool>.constant(true))
    }
}
