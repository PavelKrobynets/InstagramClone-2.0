//
//  FeedCell.swift
//  InstagramClone2
//
//  Created by mac on 14.12.2021.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    @ObservedObject var viewModel : FeedCellViewModel
    var didLike : Bool{
        return viewModel.post.didLike ?? false
    }
    init(viewModel: FeedCellViewModel){
        self.viewModel = viewModel
    }
    var body: some View {
        VStack(alignment: .leading){
            if let user = viewModel.post.user{
            NavigationLink(destination: ProfileView(user: user)){
                    HStack {
                        KFImage(URL(string: viewModel.post.ownerImageURL))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 45, height: 45)
                            .padding(.bottom, -5)
                        
                        Text(viewModel.post.ownerUsername)
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(.primary)
                    }
                    .padding([.leading, .bottom], 8)
                }
            }else {
                HStack {
                   Image("ProfileImage")
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 45, height: 45)
                        .padding(.bottom, -5)
                    
                    Text(viewModel.post.ownerUsername)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.primary)
                }
                .padding([.leading, .bottom], 8)
            }
            
            
            KFImage(URL(string: viewModel.post.imageURL))
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 400)
                .clipped()
            
            // buttons
            HStack(spacing: 15){
                Button {
                    didLike ? viewModel.unlike() : viewModel.like()
                } label: {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .foregroundColor(didLike ? .red : .black)
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
            
            Text(viewModel.post.likes == 1 ? "\(viewModel.post.likes) like" : "\(viewModel.post.likes) likes")
                .font(.system(size: 14, weight: .bold ))
                .padding(.leading, 8)
                .padding(.vertical, 2)
            
            HStack{
                Text(viewModel.post.ownerUsername).font(.system(size: 14, weight: .semibold)) + Text(" \(viewModel.post.caption)")
                    .font(.system(size: 14, weight: .regular ))
            }.padding(.horizontal, 8)
            
            Text(viewModel.timestamp)
                .font(.system(size: 12))
                .foregroundColor(.gray)
                .padding(.leading, 8)
        }
    }
}


