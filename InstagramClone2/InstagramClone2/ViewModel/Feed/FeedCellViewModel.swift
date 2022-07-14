//
//  FeedCellViewModel.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 30.06.2022.
//

import SwiftUI
import Firebase

class FeedCellViewModel: ObservableObject{
    @Published var post: Post
    init(post:Post){
        self.post = post
        fetchUser()
        checkLike()
    }
    
    func fetchUser(){
        COLLECTION_USERS.document(post.ownerUid).getDocument { snap, err in
            if let err = err{
                print("DEBUG: failed fetching user for feed cell with error\(err.localizedDescription)")
            }
            self.post.user = try? snap?.data(as: User.self)
            guard let userImageURL = self.post.user?.profileImageURL else { return }
            self.post.ownerImageURL = userImageURL
        }
    }
    
    func like(){
        guard let postId = post.id else { return }
        guard let userId = AuthViewModel.shared.userSession?.uid else { return }
        COLLECTION_POSTS
            .document(postId).collection("post-likes")
            .document(userId).setData([:]) { err in
                if let err = err {
                    print("DEBUG: failed uloading like with error \(err.localizedDescription)")
                    return
                }
                COLLECTION_USERS.document(userId).collection("user-likes")
                    .document(postId).setData([:]) { err in
                        if let err = err {
                            print("DEBUG: failed updating user likes with error \(err.localizedDescription)")
                            return
                        }
                        COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes + 1 ]) { err in
                            if let err = err {
                                print("DEBUG: failed updating likes  \(err.localizedDescription)")
                                return
                            }
                            self.post.likes += 1
                            self.post.didLike = true
                            NotificationsViewModel.sendNotification(withUid: self.post.ownerUid, type: .like, post: self.post)
                        }
                    }
            }
    }
    
    func unlike(){
        guard post.likes > 0 else { return } 
        guard let postId = post.id else { return }
        guard let userId = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_POSTS.document(postId).collection("post-likes")
            .document(userId).delete { err in
                if let err = err{
                    print("DEBUG: Failed delete like \(err.localizedDescription)")
                    return
                }
            }
        
        COLLECTION_USERS.document(userId).collection("user-likes")
            .document(postId).delete { err in
                if let err = err{
                    print("DEBUG: Failed deleting like from user \(err.localizedDescription)")
                    return
                }
                
                
                COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes - 1 ]) { err in
                    if let err = err {
                        print("DEBUG: failed - updating likes  \(err.localizedDescription)")
                        return
                    }
                    self.post.likes -= 1
                    self.post.didLike = false
                }
            }
    }
    
    
    func checkLike(){
        guard let postId = post.id else { return }
        guard let userId = AuthViewModel.shared.userSession?.uid else { return }
        COLLECTION_POSTS.document(postId).collection("post-likes")
            .document(userId).getDocument { snap, err in
                if let err = err {
                    print("DEBUG: failed checking likes \(err.localizedDescription)")
                    return
                }
                guard let didLike = snap?.exists else { return }
                self.post.didLike = didLike
            }
    }
    
    var timestamp : String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 2
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: post.timestamp.dateValue(), to: Date()) ?? ""
    }
}
