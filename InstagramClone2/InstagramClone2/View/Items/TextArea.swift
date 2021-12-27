//
//  TextArea.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 27.12.2021.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeholder : String
    init(text: Binding<String>, placeholder: String){
        self._text = text
        self.placeholder = placeholder
        UITextView.appearance().backgroundColor = .clear
    }
    var body: some View {
        ZStack(alignment: .topLeading){
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
            TextEditor(text: $text)
                .padding(4)
        }
        .font(.body)
    }
}


