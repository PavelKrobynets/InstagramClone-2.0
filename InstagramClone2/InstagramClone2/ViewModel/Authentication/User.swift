//
//  User.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 04.05.2022.
//

import Firebase
import FirebaseFirestoreSwift

struct User: Decodable,Identifiable{
    let username: String
    let email: String
    let fullname: String
    var profileImageURL: String?
    @DocumentID var id: String?
    var isFollowed: Bool? = false
    var stats: UserStatsData?
   
    var isCurrentUser: Bool {
        return AuthViewModel.shared.userSession?.uid == id
    }
  
    struct UserStatsData: Decodable {
        var following: Int
        var followers: Int
        var posts: Int
    }
    
}


