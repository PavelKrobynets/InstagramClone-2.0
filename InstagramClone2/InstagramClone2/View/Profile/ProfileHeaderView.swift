//
//  ProfileHeaderView.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 18.01.2022.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack(spacing: 45) {
                Image("Hermione")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 90, height: 90)
                    .padding(.bottom, -5)
                
                HStack(spacing: 30){
                    
                    ProfileInfo(text: "posts", count: 6)
                    ProfileInfo(text: "following", count: 299)
                    ProfileInfo(text: "followers", count: 186)
                    
                }
            }
            
            
            
            Text(AuthViewModel.shared.currentUser?.username ?? "User")
                .font(.system(size: 16, weight: .semibold))
                .padding(.leading, 12)
            Text("The best witch")
                .font(.system(size: 14))
                .padding(.leading, 4)
            
        }.foregroundColor(Color("TextColor"))
            .padding(.top)
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
