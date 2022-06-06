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
    let profileImageURL: String?
    @DocumentID var id: String?
    
}


