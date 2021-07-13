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
                        self.isShowing = false
                    }, label: { Text("Done") }).padding()
                }
            }
            Divider()
            Form {
                Section {
                    TextField("Theme Name", text: $chosenTheme.name)
                }
                Section {
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
            }
        }
    }
}

struct ThemeEditor_Previews: PreviewProvider {
    static var previews: some View {
        let theme = EmojiMemoryGameTheme.createNewTheme(named: "Test")
        ThemeEditor(chosenTheme: Binding<EmojiMemoryGameTheme>.constant(theme), isShowing: Binding<Bool>.constant(true))
    }
}
