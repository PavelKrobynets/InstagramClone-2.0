//
//  GridViewModel.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 29.06.2022.
//

import SwiftUI
import Firebase

enum PostGridFilter{
    case search
    case profile(String)
    }

class GridViewModel: ObservableObject{
    @Published var posts = [Post]()
    let filter: PostGridFilter
    
    init(filter: PostGridFilter){
        self.filter = filter
        fetchPosts()
    }
    
    
    
    func fetchPosts(){
        switch filter {
        case .search:
            fetchPostsSearchPage()
            
        case .profile(let userId):
            fetchPostProfilePage(withUid: userId)
         }
    }
    
    
    
    func fetchPostsSearchPage(){
        COLLECTION_POSTS.getDocuments { snap, err in
            if let err = err {
                print("DEBUG: Failed fetching post for grid with error\(err.localizedDescription)")
                return
            }
            guard let documents = snap?.documents else { return }
            self.posts = documents.compactMap({try? $0.data(as: Post.self)})
        }
    }
    
    
    
    
    func fetchPostProfilePage(withUid uid: String){
        COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snap, err in
            if let err = err {
                print("DEBUG: Failed fetching post for grid with error\(err.localizedDescription)")
                return
            }
            guard let documents = snap?.documents else { return }
            self.posts = documents.compactMap({try? $0.data(as: Post.self)})
        }
    }
}
