//
//  AuthViewModel.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 04.05.2022.
//

import SwiftUI
import Firebase


class AuthViewModel: ObservableObject {
    @Published var userSession : Firebase.User?
    static let shared = AuthViewModel()
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, err in
            if let err = err{
                print(err.localizedDescription)
                print("Debug : login error")
                return
            }
            guard let user = result?.user else { return }
            
            self.userSession = user
        }
    }
    
    func register(withEmail email: String, password: String, username: String, fullname: String){
        Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
            if let err = err{
                print(err.localizedDescription)
                return
            }
            guard let user = result?.user else { return }
            
            let data = [
                "email": email,
                "username": username,
                "fullname": fullname,
                "uid": user.uid
            
            ]
            
            Firestore.firestore().collection("users").document(user.uid).setData(data) { err in
                if let err = err {
                    print(err.localizedDescription)
                    return

                print("DEBUG: user was created ")
            }
        }
    }
}
}
