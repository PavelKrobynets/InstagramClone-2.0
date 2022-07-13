//
//  Constats.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 29.06.2022.
//

import Foundation
import Firebase

let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_POSTS = Firestore.firestore().collection("posts")
let COLLECTION_FOLLOW = Firestore.firestore().collection("following")
let COLLECTION_NOTIFICATIONS = Firestore.firestore().collection("notifications")
