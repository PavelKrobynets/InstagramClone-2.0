//
//  RegisterView.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 24.01.2022.
//

import SwiftUI

struct RegisterView: View {
    @State var email = ""
    @State var pass = ""
    @State var fullName = ""
    @State var userName = ""
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.purple, Color.red, Color.yellow],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            VStack(spacing: 18){
                Image("InstaLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width / 1.3, height: UIScreen.main.bounds.height / 8)
                
                CustomtextField(placeholder: "Email", text: $email, image: "envelope")
                CustomtextField(placeholder: "Username", text: $userName, image: "person")
                CustomtextField(placeholder: "Full name", text: $fullName, image: "person")
                CustomSecureField(pass: $pass, image: "lock", placeholder: "password")
                    .padding(.bottom)
                
                Button {
                    //
                } label: {
                    Text("Sign In")
                }.font(.headline)
                    .frame(width: UIScreen.main.bounds.width / 1.2,
                           height: UIScreen.main.bounds.height / 18)
                    .background(Color("ButtonColor"))
                    .cornerRadius(15)
                
                Spacer()
                
                Button {
                    //
                } label: {
                    Text("Don't have an account ?  ")
                        .font(.system(size: 13)) +
                    Text("Sign Up")
                        .font(.system(size: 14, weight: .semibold))
                }.padding(.bottom, 40)
                
            }.padding(.top, 120)
        }.ignoresSafeArea()
            .foregroundColor(.white)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
