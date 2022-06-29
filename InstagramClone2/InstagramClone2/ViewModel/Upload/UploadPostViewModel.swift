//
//  UploadPostViewModel.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 28.06.2022.
//

import SwiftUI
import Firebase

class UploadPostViewModel: ObservableObject{
    
    
    func uploadPost(image: UIImage, caption: String){
        guard let user = AuthViewModel.shared.currentUser else { return}
        ImageUploader.upladImage(image: image, type: .post) { imageURL in
            
            guard let uid = user.id else { return }
            guard let imageUid = user.profileImageURL else { return }
            let data = ["caption": caption,
                        "timestamp": Timestamp(date: Date()),
                        "likes": 0,
                        "imageURL": imageURL,
                        "ownerUid": uid,
                        "ownerImageURL": imageUid,
                        "ownerUsername": user.username] as [String : Any]
            COLLECTION_POSTS.addDocument(data: data) { err in
                if let err = err{
                    print("DEBUG: Failed Post data uploading\(err.localizedDescription)")
                    return
                }
                
            }
            print("DEBUG: Post uploaded")
        }
    }
}


