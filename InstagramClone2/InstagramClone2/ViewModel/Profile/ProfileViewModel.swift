//
//  ProfileViewModel.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 13.06.2022.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject{
     
    @Published var user : User
    
    init(user: User){
        self.user = user
    }
    
    func changeProfileImage(image: UIImage, completinon: @escaping(String) -> Void){
        guard let imageData = image.jpegData(compressionQuality:  0.5) else { return }
        
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        
        ref.putData(imageData, metadata: nil) { (_, err) in
            if let err = err{
                print(err.localizedDescription)
                print("DEBUG: failed uploading image")
                return
            }
            
            ref.downloadURL { url, err in
                if let err = err {
                    print(err.localizedDescription)
                    print("DEBUG: failed to upload url")
                    return
                }
                guard let imageURL = url?.absoluteString else { return }
            }
        }
    }
}

