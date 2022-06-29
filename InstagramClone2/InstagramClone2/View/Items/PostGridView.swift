//
//  PostGridView.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 22.12.2021.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    
    let items = [GridItem(),GridItem(),GridItem()]
    let width = UIScreen.main.bounds.width / 3
    let filter: PostGridFilter
    @ObservedObject var viewModel : GridViewModel
    
    init(filter: PostGridFilter){
        self.filter = filter
        self.viewModel = GridViewModel(filter: filter)
    }
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 2) {
            ForEach(viewModel.posts) { post in
                KFImage(URL(string: post.imageURL))
                    .resizable()
                    .scaledToFill()
                    .frame(width: width , height: width)
                    .clipped()
            }
        }
    }
}

