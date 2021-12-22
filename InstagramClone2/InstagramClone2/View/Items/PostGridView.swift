//
//  PostGridView.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 22.12.2021.
//

import SwiftUI

struct PostGridView: View {
    let items = [GridItem(),GridItem(),GridItem()]
    let width = UIScreen.main.bounds.width / 3
    var body: some View {
        LazyVGrid(columns: items, spacing: 2) {
            ForEach(0 ..< 9) { _ in
                Image("Hermione")
                    .resizable()
                    .scaledToFill()
                    .frame(width: width , height: width)
                    .clipped()
            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}
