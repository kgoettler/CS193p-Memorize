//
//  EmojiMemoryGameChooser.swift
//  Memorize
//
//  Created by Ken Goettler on 7/11/21.
//

import SwiftUI

struct EmojiMemoryGameChooser: View {
    @EnvironmentObject var store: EmojiMemoryGameStore
    @State private var editMode: EditMode = .inactive
    @State private var selectedTheme: EmojiMemoryGameTheme?
    var body: some View {
        NavigationView {
            List {
                ForEach(store.themes) {theme in
                    NavigationLink(
                        destination: EmojiMemoryGameView(theme: theme),
                        label: {
                            EmojiThemeListView(theme: theme, editMode: $editMode)
                                .environmentObject(store)
                    })
                }
                .onDelete { indexSet in
                    indexSet.map { self.store.themes[$0] }.forEach { theme in
                        self.store.removeTheme(theme)
                    }
                }
            }
            .navigationBarTitle("Memorize")
            .navigationBarItems(
                leading: Button(action: {
                    self.store.addTheme()
                }, label: {
                    Image(systemName: "plus").imageScale(.large)
                }),
                trailing: EditButton()
            )
            .environment(\.editMode, $editMode)
        }
    }
}

struct EmojiThemeListView: View {
    @EnvironmentObject var store: EmojiMemoryGameStore
    var theme: EmojiMemoryGameTheme
    @Binding var editMode: EditMode
    @State private var isEditing: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                HStack {
 
                    Text(theme.name.capitalized)
                        .font(.title)
                    Spacer()
                    Text("\(theme.emojis.joined(separator: ""))")
                }
                if editMode == .active {
                    Color.clear
                        .contentShape(Rectangle())
                        .onTapGesture {
                            self.isEditing = true
                        }
                }
            }
        }
        .sheet(isPresented: $isEditing) {
            ThemeEditor(chosenTheme: .constant(theme), isShowing: $isEditing)
                .environmentObject(store)
        }
    }
}

struct EmojiMemoryGameChooser_Previews: PreviewProvider {
    static var previews: some View {
        let store = EmojiMemoryGameStore()
        EmojiMemoryGameChooser()
            .environmentObject(store)
    }
}
