//
//  UserListView.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 27.12.2021.
//

import SwiftUI

struct UserListView: View {
    var viewModel: SearchViewModel
    @Binding var searchText: String
    var users: [User]{
        return searchText.isEmpty ? viewModel.users : viewModel.fillterUsers(withText: searchText)
    }
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(users){ user in
                    NavigationLink(destination: ProfileView(user: user)){
                        UserCell(user: user)
                    }
                    
                }
            }
        }
    }
}

