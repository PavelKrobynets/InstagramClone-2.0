//
//  Notifications.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 13.07.2022.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct Notification: Decodable, Identifiable {
    @DocumentID var id: String?
    let postId: String?
    let username: String
    var profileImageURL: String?
    var timestamp: Timestamp
    let uid: String
    var type: NotificationType
    
    var post: Post?
    var user: User?
}

enum NotificationType: Int, Decodable{
    case follow
    case comment
    case like
    
    var notificationsMessage: String{
        switch self {
        case .follow:
            return "started following you"
        case .comment:
            return "commented your post"
        case .like:
            return "liked your post"
        }
    }
}
