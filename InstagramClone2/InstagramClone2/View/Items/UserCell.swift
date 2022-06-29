//
//  UserCell.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 27.12.2021.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let user : User
    var body: some View {
        HStack{
            if let imageURL = user.profileImageURL{
                KFImage(URL(string: imageURL))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            } else {
                Image("ProfileImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }
            
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.system(size: 16, weight: .semibold))
                
                Text(user.fullname)
                    .font(.system(size: 15))
            }
            Spacer()
        }.padding(.leading)
    }
}

