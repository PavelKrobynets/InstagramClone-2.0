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
        
    }
    
    func changeProfileImage(image: UIImage, completion: @escaping(String) -> Void){
        
        guard let uid = self.user.id else { return }
        ImageUploader.uploadImage(image: image, type: .profile) { imageURL in
            
            COLLECTION_USERS.document(uid).updateData(["profileImageURL" : imageURL]) { err in
                print(err?.localizedDescription ?? "")
                return
            }
            self.user.profileImageURL = imageURL
        }
        
    }
    
    func follow(uid: String){
        guard let uid = user.id else { return }
        FollowControl.follow(uid: uid) { _ in
       //     self.user.isFollowed = true
        }
    }
    
    func unfollow(){
        
    }
    
    func checkIfFollowed(){
        
    }
    
}
