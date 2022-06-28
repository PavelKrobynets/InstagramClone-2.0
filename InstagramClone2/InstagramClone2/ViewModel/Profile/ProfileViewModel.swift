//
//  ProfileViewModel.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 13.06.2022.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject{
     
    @Published var user : User
    
    init(user: User){
        self.user = user
        checkProfileImage()
        
    }
    
    func changeProfileImage(image: UIImage, completinon: @escaping(String) -> Void){
     
        guard let uid = self.user.id else { return }
        ImageUploader.upladImage(image: image, type: .profile) { imageURL in
            
          Firestore.firestore().collection("users").document(uid).updateData(["profileImageURL" : imageURL]) { err in
                print(err?.localizedDescription ?? "")
                return
            }
            self.user.imagePicked = true
        }
        
    
    }
    func checkProfileImage(){
        if user.profileImageURL == nil{
            self.user.imagePicked = false
        }else{
            self.user.imagePicked = true
        }
    }
}


