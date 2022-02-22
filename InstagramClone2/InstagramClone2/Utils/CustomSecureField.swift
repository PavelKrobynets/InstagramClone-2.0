//
//  CustomSecureField.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 24.01.2022.
//

import SwiftUI

struct CustomSecureField: View {
    @Binding var pass : String
    var image: String
    var placeholder: String
    var body: some View {
        Label {
            SecureField("", text: $pass)
                .placeholder(when: pass.isEmpty, placeholder: {
                    Text(placeholder).foregroundColor(.white)
                })
        } icon: {
            Image(systemName: image)
        }.padding()
            .background(Color(.init(white: 1,alpha: 0.25)))
            .cornerRadius(10)
            .padding(.horizontal)
    }
}





