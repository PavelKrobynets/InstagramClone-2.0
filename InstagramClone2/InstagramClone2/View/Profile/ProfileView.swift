//
//  ProfileView.swift
//  InstagramClone2
//
//  Created by mac on 14.12.2021.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    var body: some View {
        ScrollView{
            VStack{
                ProfileHeaderView(viewModel: ProfileViewModel(user: user))
                if let currentProfileId = user.id{
                    PostGridView(filter: .profile(currentProfileId))
                }
            }
        }
    }
}

