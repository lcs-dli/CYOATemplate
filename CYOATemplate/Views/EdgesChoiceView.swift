//
//  EdgesChoiceView.swift
//  CYOATemplate
//
//  Created by Justin Zack Wei on 2024-06-14.
//

import SwiftUI

struct EdgesChoiceView: View {
    
    
    // MARK: Stored properties
    let prompt: String
    let toPage: Int
    
    // Access the book state through the environment
    @Environment(BookStore.self) var book
    
    @State private var pageThisEdgeLeadsToHasBeenReadBefore = false
    
    var body: some View {
        HStack {
            Spacer()
            Text(
                try! AttributedString(
                    markdown: prompt,
                    options: AttributedString.MarkdownParsingOptions(
                        interpretedSyntax: .inlineOnlyPreservingWhitespace
                    )
                )
            )
            .multilineTextAlignment(.trailing)
            .foregroundColor(pageThisEdgeLeadsToHasBeenReadBefore ? Color.gray : Color.black)
        }
        .task {
            Task {
                pageThisEdgeLeadsToHasBeenReadBefore = try await book.hasPageBeenReadBefore(pageId: toPage)
            }
        }
    }
}

#Preview {
    EdgesChoiceView(prompt: "Go to the next page", toPage: 1)
        .environment(BookStore())
}
