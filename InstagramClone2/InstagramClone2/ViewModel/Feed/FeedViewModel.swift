//
//  FeedViewModel.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 29.06.2022.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

class FeedViewModel: ObservableObject{
    @Published var posts = [Post]()
    
    init(){
        fetchPosts()
       
    }
    
    func fetchPosts(){
        COLLECTION_POSTS.getDocuments { snap, err in
            if let err = err {
                print("DEBUG: failed fetching post with error : \(err.localizedDescription)")
                return
            }
            guard let documents = snap?.documents else { return }
            
            self.posts = documents.compactMap({try? $0.data(as: Post.self)})
        }
    }
}
