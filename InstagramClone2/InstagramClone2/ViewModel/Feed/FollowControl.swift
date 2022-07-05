//
//  FollowControl.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 05.07.2022.
//

import SwiftUI
import Firebase


struct FollowControl{
    
    static func follow(uid: String, completion: ((Error?)-> Void)?){
          guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_FOLLOW.document(currentUid).collection("user-following").document(uid).setData([:]){ _ in
                 COLLECTION_FOLLOW.document(uid).collection("user-followers").document(currentUid).setData([:], completion: completion)
        }
    }
    
    static func unFollow(uid: String, completion: ((Error?)-> Void)?){
          guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_FOLLOW.document(currentUid).collection("user-following").document(uid).delete{ _ in
                 COLLECTION_FOLLOW.document(uid).collection("user-followers").document(currentUid).delete( completion: completion)
        }
    }
    
    static func checkIfUserIsFollowed(uid: String, completion: @escaping (Bool)->Void){
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_FOLLOW.document(currentUid).collection("user-following").document(uid).getDocument { snap, _ in
            guard let isFollowed = snap?.exists else { return }
            completion(isFollowed)
        }
    }
}
