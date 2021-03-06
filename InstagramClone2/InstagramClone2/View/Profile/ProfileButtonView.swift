//
//  ProfileButtonView.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 28.06.2022.
//

import SwiftUI

struct ProfileButtonView: View {
    @ObservedObject var viewModel: ProfileViewModel
    var isFollowing: Bool{ return viewModel.user.isFollowed ?? false}
    var body: some View {
        if viewModel.user.isCurrentUser{
            Button {
                
            } label: {
                Text("Edit Profile")
                    .font(.system(size: 14, weight: .semibold))
                    .frame(width: 360, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 3)
                        .stroke(Color.gray,lineWidth: 1)
                    )
            }
        }else{
            HStack(spacing: 16){
                Button {
                    if viewModel.user.id != nil{
                        isFollowing ? viewModel.unfollow() : viewModel.follow()
                    }
                } label: {
                    Text(isFollowing ? "Following" : "Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(isFollowing ? .black : .white)
                        .background(isFollowing ? .white : .blue)
                        .overlay(RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray,lineWidth: isFollowing ? 1 : 0)
                        )
                }
                
                Button {
                    
                } label: {
                    Text("Message")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(.black)
                        .overlay(RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray,lineWidth: 1)
                        )
                }

            }
        }
    }
}


