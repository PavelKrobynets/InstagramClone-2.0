//
//  SearchViewModel.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 29.06.2022.
//

import SwiftUI
import Firebase

class SearchViewModel: ObservableObject{
    @Published var users = [User]()
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers(){
        COLLECTION_USERS.getDocuments { snap, err in
            guard let documents = snap?.documents else { return }
            self.users = documents.compactMap({try? $0.data(as: User.self)})
            print(self.users)
        }
    }
    
    func fillterUsers(withText input: String)-> [User]{
        let lowercasedInput = input.lowercased()
        return users.filter({$0.fullname.lowercased().contains(lowercasedInput) ||
            $0.username.lowercased().contains(lowercasedInput)
        })
        
  
}
}
