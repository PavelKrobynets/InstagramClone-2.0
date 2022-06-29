//
//  FeedCell.swift
//  InstagramClone2
//
//  Created by mac on 14.12.2021.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    let post: Post
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                KFImage(URL(string: post.ownerImageURL))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                .frame(width: 45, height: 45)
                .padding(.bottom, -5)
                
                Text(post.ownerUsername)
                    .font(.system(size: 15, weight: .semibold))
            }
            .padding([.leading, .bottom], 8)
            
            KFImage(URL(string: post.imageURL))
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 400)
                .clipped()
                
         // buttons
            HStack(spacing: 15){
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "bubble.right")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                }

            }.font(.system(size: 22))
                .padding([.leading, .top], 8)
                .foregroundColor(Color(.darkGray))
            
            Text(post.likes == 1 ? "\(post.likes) like" : "\(post.likes) likes")
                .font(.system(size: 14, weight: .bold ))
                .padding(.leading, 8)
                .padding(.vertical, 2)
            
            HStack{
                Text(post.ownerUsername).font(.system(size: 14, weight: .semibold)) + Text(" \(post.caption)")
                    .font(.system(size: 14, weight: .regular ))
            }.padding(.horizontal, 8)
            
            Text("2h")
                .font(.system(size: 12))
                .foregroundColor(.gray)
                .padding(.leading, 8)
        }
    }
}


