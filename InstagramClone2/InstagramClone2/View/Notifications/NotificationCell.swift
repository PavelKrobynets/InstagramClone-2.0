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
                    //
                } label: {
                    Text("follow")
                            .padding(.horizontal,32)
                            .padding(.vertical, 7)
                            .foregroundColor(.white)
                            .background(.blue)
                            .clipShape(Capsule())
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
             
        }.padding(.horizontal, 4)
    }
}

