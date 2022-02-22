//
//  CustomtextField.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 24.01.2022.
//

import SwiftUI

struct CustomTextField: View {
    var placeholder : String
    @Binding var text: String
    var image: String
    var body: some View {
        Label {
            TextField("", text: $text)
                .placeholder(when: text.isEmpty) {
                    Text(placeholder).foregroundColor(.white)
                }
        } icon: {
            Image(systemName: "person").foregroundColor(.white)
        }.padding()
            .background(Color(.init(white: 1,alpha: 0.25)))
            .cornerRadius(10)
            .padding(.horizontal)
    }
}
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}


