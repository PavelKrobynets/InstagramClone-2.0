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
    @Published var currentUser: User?
    static let shared = AuthViewModel()
    
    init(){
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, err in
            if let err = err{
                print(err.localizedDescription)
                print("Debug : login error")
                return
            }
            guard let user = result?.user else { return }
            
            self.userSession = user
            self.fetchUser()
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
                }
                self.userSession = user
                self.fetchUser()
                print("DEBUG: user was created ")
            
        }
           
    }
}
    func logOut(){
        self.userSession = nil
        try? Auth.auth().signOut()
        print("DEBUG: logout completed")
    }
    
    func fetchUser() {
        
        guard let uid = userSession?.uid else { return }
        
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, err in
            if let err = err {
                print(err.localizedDescription)
                return
            }
           
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
            
        }
    }
}

