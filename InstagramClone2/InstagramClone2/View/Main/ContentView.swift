//
//  ContentView.swift
//  InstagramClone2
//
//  Created by mac on 14.12.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel : AuthViewModel
    @State var selectedIndex = 0
    var body: some View {
       
        Group{
            if viewModel.userSession == nil{
                SignInView()
            }else{
                if let user = viewModel.currentUser{
                    MainView(user: user, selectedIndex: $selectedIndex)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
