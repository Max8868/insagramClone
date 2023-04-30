//
//  CommentService.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 30/04/23.
//

import Firebase

struct CommentService {
    
    static func uploadComment(comment: String, postID: String, user: User, completion: @escaping(FirestoneCompetion)) {
        let data: [String: Any] = [
            "uid":  user.uid,
            "comment": comment,
            "timestamp": Timestamp(date: Date()),
            "username": user.username,
            "profileImageUrl": user.profileImageUrl
            ]
        COLLECTION_POSTS.document(postID).collection("comments").addDocument(data: data, completion: completion)
    }
    
    static func fetchComments() {
        
    }
}
