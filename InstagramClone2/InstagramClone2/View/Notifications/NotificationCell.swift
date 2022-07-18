//
//  NotificationCell.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 27.12.2021.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    @ObservedObject var viewModel: NotificationsCellViewModel
    var isFollowing: Bool{ return viewModel.notification.isFollowed ?? false}
    
    var body: some View {
        HStack{
            if let user = viewModel.notification.user{
                NavigationLink {
                    ProfileView(user: user)
                } label: {
                    if let imageURL = viewModel.notification.profileImageURL {
                        KFImage(URL(string: imageURL))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .padding(.leading, 3)
                    }else{
                        Image("ProfileImage")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                
                    Text("\(viewModel.notification.username): ")
                        .font(.system(size: 14, weight: .semibold))
                    + Text("\(viewModel.notification.type.notificationsMessage) ").font(.system(size: 15))
                    + Text(viewModel.timestamp).foregroundColor(.gray).font(.system(size: 12))
                }.foregroundColor(.primary)
            }
            Spacer()
            
            if  viewModel.notification.type == .follow {
                Button {
                    if viewModel.notification.id != nil{
                        isFollowing ? viewModel.unfollow() : viewModel.follow()
                    }
                } label: {
                    Text(isFollowing ? "Following" : "Follow")
                        .padding(.horizontal,32)
                        .padding(.vertical, 7)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(isFollowing ? .black : .white)
                        .background(isFollowing ? .white : .blue)
                        .cornerRadius(15)
                        .padding(.trailing, 4)
                        .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray,lineWidth: isFollowing ? 1 : 0)
                            .padding(.trailing, 4)
                        )
                }
            }else{
                if let post = viewModel.notification.post{
                    NavigationLink {
                        FeedCell(viewModel: FeedCellViewModel(post: post))
                    } label: {
                        KFImage(URL(string: post.imageURL))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipped()
                            .padding(.trailing, 25)
                    }
                }
            }
        }
    }
}


