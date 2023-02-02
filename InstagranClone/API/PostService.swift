//
//  PostService.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 28/01/23.
//

import Foundation

import Firebase
import UIKit

struct PostService {
    
    static func uploadPost(caption: String, image: UIImage, completion: @escaping(FirestoneCompetion)) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        ImageUploader.uploadImage(image: image) { imagUrl in
            let data = ["caption": caption,
                        "timestamp": Timestamp(date: Date()),
                        "likes": 0,
                        "imageUrl": imagUrl,
                        "ownerUid": uid] as [String: Any]
            COLLECTION_POSTS.addDocument(data: data, completion: completion)
        }
    }
}
