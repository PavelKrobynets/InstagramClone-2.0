//
//  SignInView.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 24.01.2022.
//

import SwiftUI

struct SignInView: View {
    @State var email = ""
    @State var pass = ""
    var body: some View {
        NavigationView{
        ZStack {
            LinearGradient(colors: [Color.purple, Color.red, Color.yellow],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            VStack(spacing: 15){
                Image("InstaLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width / 1.3, height: UIScreen.main.bounds.height / 8)
                    
                
                CustomtextField(placeholder: "Email", text: $email, image: "envelope")
                CustomSecureField(pass: $pass, image: "lock", placeholder: "Password")
                
                HStack{
                    Spacer()
                    
                    Button {
                        //
                    } label: {
                        Text("Forgot the password ?")
                    }.padding(.trailing)
                        .padding(.vertical, 5)
                        .font(.system(size: 13, weight: .semibold))

                }
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
                
                NavigationLink {
                    RegisterView()
                } label: {
                    HStack{
                    Text("Don't have an account ?  ")
                        .font(.system(size: 13)) +
                    Text("Sign Up")
                        .font(.system(size: 14, weight: .semibold))
                    }
                    }.padding(.bottom, 40)


            }.foregroundColor(.white)
                .padding(.top, 120)
        }.ignoresSafeArea()
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
