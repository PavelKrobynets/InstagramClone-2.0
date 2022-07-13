//
//  NotificationsViewModel.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 13.07.2022.
//

import SwiftUI
import Firebase

class NotificationsViewModel: ObservableObject{
    static func sendNotification(withUid uid: String, type: NotificationType, post: Post? = nil){
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let userId = user.id else { return }
        var data : [String: Any] = [
            "timestamp": Timestamp(date: Date()),
            "username": user.username,
            "uid": userId,
            "profileImageURL": user.profileImageURL ?? "",
            "type": type.rawValue
        ]
        
        if let post = post, let postId = post.id{
            data["postId"] = postId
        }
        
        COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications").addDocument(data: data){ err in
            if let err = err {
            print("DEBUG: Failed uploading notification with error \(err.localizedDescription)")
          }

        }
    }
}

