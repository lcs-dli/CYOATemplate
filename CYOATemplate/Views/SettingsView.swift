//
//  SettingsView.swift
//  CYOATemplate
//
//  Created by Russell Gordon on 2024-06-02.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: Stored properties
    
    // Whether this view is showing in the sheet right now
    @Binding var showing: Bool
    
    @State var backgroundColor: String = "white"
    
    let colorList: [String] = ["white", "blue", "yellow", "gray"]
    // Access the book state through the environment
    @Environment(BookStore.self) var book
    
    // MARK: Computed properties
    var body: some View {
        
        // Make the connection to the book state a two-way binding
        // (By default when accessing through environment it is read-only)
        @Bindable var book = book
        
        // The user interface
        return NavigationStack {
            
            VStack {
                Toggle(isOn: $book.reader.prefersDarkMode) {
                    Label {
                        Text("Dark Mode")
                    } icon: {
                        Image(systemName: "moonphase.first.quarter")
                    }
                }
                
                Spacer()
                
                Picker("Choose the background color", selection: $backgroundColor){
                    ForEach(0..<4){ index in
                        HStack{
                            Text(colorList[index])
                            Circle()
                                .foregroundColor(stringtoColor(s: colorList[index]))
                        }
                        
                        
                    }
                    .onChange(of: backgroundColor){
                        
                    }
                }
            }
            .padding()
            .navigationTitle("Statistics")
            // Toolbar to show buttons for various actions
            .toolbar {
                
                // Hide this view
                ToolbarItem(placement: .automatic) {
                    Button {
                        showing = false
                    } label: {
                        Text("Done")
                            .bold()
                    }

                }
            }

        }
        // Dark / light mode toggle
        .preferredColorScheme(book.reader.prefersDarkMode ? .dark : .light)

    }
    
    //MARK: Function
    func stringtoColor(s: String) -> Color {
        switch s{
        case "white":
            return .white
        case "blue":
            return .blue
        case "yellow":
            return .yellow
        default:
            return .gray
        }
    
        
    }
}

#Preview {
    SettingsView(showing: Binding.constant(true))
}
