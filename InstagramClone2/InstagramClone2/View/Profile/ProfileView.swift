//
//  ProfileView.swift
//  InstagramClone2
//
//  Created by mac on 14.12.2021.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView{
            VStack{
                ProfileHeaderView()
                PostGridView()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
