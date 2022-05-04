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
    @Environment (\.presentationMode) var mode
   @EnvironmentObject var ViewModel : AuthViewModel
    
    
    //Check the observable object above next time  !!!!!
    
    
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
                
                CustomTextField(placeholder: "Email", text: $email, image: "envelope")
                CustomTextField(placeholder: "Username", text: $userName, image: "person")
                CustomTextField(placeholder: "Full name", text: $fullName, image: "person")
                CustomSecureField(pass: $pass, image: "lock", placeholder: "Password")
                    .padding(.bottom)
                
                Button {
                    ViewModel.register(withEmail: email, password: pass, username: userName, fullname: fullName)
                } label: {
                    Text("Sign Up")
                }.font(.headline)
                    .frame(width: UIScreen.main.bounds.width / 1.2,
                           height: UIScreen.main.bounds.height / 18)
                    .background(Color("ButtonColor"))
                    .cornerRadius(15)
                
                Spacer()
                
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Text("Already have an account ?  ")
                        .font(.system(size: 13)) +
                    Text("Sign In")
                        .font(.system(size: 14, weight: .semibold))
                }
                .padding(.bottom, 40)
                
            }.padding(.top, 120)
        }.ignoresSafeArea()
            .foregroundColor(.white)
            .navigationBarHidden(true)
    }
}

