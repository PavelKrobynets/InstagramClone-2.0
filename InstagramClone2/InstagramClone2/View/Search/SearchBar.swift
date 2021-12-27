//
//  SearchBar.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 22.12.2021.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var isEditing: Bool
    var body: some View {
        HStack{
            TextField("Search...", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                )
            if isEditing{
                    Button {
                        isEditing = false
                        text = ""
                        UIApplication.shared.endEditing()
                    } label: {
                        Text("cancel")
                            .foregroundColor(Color("TextColor"))
                            .padding(.trailing, 8)
                            .transition(.move(edge: .trailing))
                            .animation(.default, value: 3)
                    }
            
                
            }
        }.onTapGesture {
            isEditing = true
        }
        
       
        
    }
}


