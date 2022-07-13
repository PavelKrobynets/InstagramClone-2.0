//
//  ProfileViewModel.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 13.06.2022.
//

import SwiftUI
import Firebase
import FirebaseFirestore

class ProfileViewModel: ObservableObject{
    
    @Published var user : User
    
    init(user: User){
        self.user = user
        checkIfFollowed()
        checkStats()
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
    
    func follow(){
        guard let uid = user.id else { return }
        FollowControl.follow(uid: uid) { _ in
            self.user.isFollowed = true
        }
    }
    
    func unfollow(){
        guard let uid = user.id else { return }
        FollowControl.unFollow(uid: uid) { _ in
            self.user.isFollowed = false
        }
    }
    
    func checkIfFollowed(){
        guard  !user.isCurrentUser else { return }
        guard let uid = user.id else { return }
        FollowControl.checkIfUserIsFollowed(uid: uid) { isFollowed in
            self.user.isFollowed = isFollowed
        }
    }
    
    func checkStats(){
        guard let uid = user.id else { return }
        
        COLLECTION_FOLLOW.document(uid).collection("user-followers").getDocuments { snap, _ in
            guard let followers = snap?.documents.count else { return }
            
            
            COLLECTION_FOLLOW.document(uid).collection("user-following").getDocuments { snap, _ in
                guard let following = snap?.documents.count else { return }
              
                
                COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snap, _ in
                    guard let posts = snap?.documents.count else { return }
                  
                    self.user.stats = User.UserStatsData(following: following, followers: followers, posts: posts)
               
                }
            }
        }
    }
}
