//
//  NotificationsCellViewModel.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 14.07.2022.
//

import SwiftUI
import Firebase


class NotificationsCellViewModel: ObservableObject {
    
    @Published var notification: Notification
    
    init(notification: Notification){
        self.notification = notification
        fetchUser()
        fetchPost()
    }
    
    
    var timestamp : String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 2
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: notification.timestamp.dateValue(), to: Date()) ?? ""
    }
    
    
    func fetchUser(){
        COLLECTION_USERS.document(notification.uid).getDocument { snap, _ in
            self.notification.user = try? snap?.data(as: User.self)
        }
    }
    
    func fetchPost(){
        guard let postID = notification.postId else { return }
        COLLECTION_POSTS.document(postID).getDocument { snap, err in
            if let err = err {
                print("DEBUG: Failed fetching post for notification with error \(err.localizedDescription)")
            }
            self.notification.post = try? snap?.data(as: Post.self)
            print("DEBUG : POST FATCHED !!!!!")
        }
    }
}
