//
//  ForgotPasswordView.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 22.02.2022.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Environment (\.presentationMode) var mode
    @State private var email = ""
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.purple, Color.red, Color.yellow],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            VStack(spacing: 30){
                Image("InstaLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width / 1.3, height: UIScreen.main.bounds.height / 8)
                    
                
                CustomTextField(placeholder: "Email", text: $email, image: "envelope")
                
                Button {
                    //
                } label: {
                    Text("Reset password")
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


            }.foregroundColor(.white)
                .padding(.top, 120)
        }.ignoresSafeArea()
            .navigationBarHidden(true)
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
