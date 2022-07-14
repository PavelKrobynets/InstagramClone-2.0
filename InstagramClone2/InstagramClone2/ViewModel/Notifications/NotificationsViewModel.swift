//
//  NotificationsViewModel.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 13.07.2022.
//

import SwiftUI
import Firebase

class NotificationsViewModel: ObservableObject{
    @Published var notifications = [Notification]()
    @Published var currentNotification: Notification?
    init(){
        fetchNotifications()
    }
  static let shared = NotificationsViewModel()
    
    
    static func sendNotification(withUid uid: String, type: NotificationType, post: Post? = nil) {
        
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let userId = user.id else { return }
        
        var data : [String: Any] = ["timestamp": Timestamp(date: Date()),
                                    "username" : user.username,
                                    "uid": userId,
                                    "profileImageURL": user.profileImageURL ?? "" ,
                                    "type": type.rawValue]
        
        if let post = post, let id = post.id {
            data["postId"] = id
        }
        
        COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications").addDocument(data: data) { (err) in
            if let err = err {
                print("DEBUG: Failed sending notification \(err.localizedDescription)")
                return
            }
        }
    }

 
     
    func fetchNotifications() {
        guard let userId = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_NOTIFICATIONS.document(userId).collection("user-notifications").order(by: "timestamp", descending: true).getDocuments { (snap, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            guard let documents = snap?.documents else { return }
            self.notifications = documents.compactMap({ try? $0.data(as: Notification.self)})
        }
    }
}
