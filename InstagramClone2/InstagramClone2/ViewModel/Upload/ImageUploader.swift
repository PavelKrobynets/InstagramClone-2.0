//
//  ImageUploader.swift
//  InstagramClone2
//
//  Created by Pavel Krobynets on 28.06.2022.
//

import Firebase
import SwiftUI

enum UploadType{
    case profile
    case post
    
    var filePath: StorageReference{
        let fileName = NSUUID().uuidString
        switch self{
        case .profile:
            return Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        case .post:
            return Storage.storage().reference(withPath: "/post_images/\(fileName)")
        }
       
    }
}

struct ImageUploader{
    static func upladImage(image: UIImage,type: UploadType, completion: @escaping(String)-> Void ){
        guard let imageData = image.jpegData(compressionQuality:  0.5) else { return }
            
           
        let ref = type.filePath
            
            ref.putData(imageData, metadata: nil) { (_, err) in
                if let err = err{
                    print(err.localizedDescription)
                    print("DEBUG: failed uploading image")
                    return
                }
                
                ref.downloadURL {  url, err in
                    if let err = err {
                        print(err.localizedDescription)
                        print("DEBUG: failed to upload url")
                        return
                    }
                    guard let imageURL = url?.absoluteString else { return }
                    completion(imageURL)
                }
            }
    }
}
