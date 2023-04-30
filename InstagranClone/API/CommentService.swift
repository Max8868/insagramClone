//
//  CommentService.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 30/04/23.
//

import Firebase

struct CommentService {
    
    private static let collection = "comments"
    
    static func uploadComment(comment: String, postID: String, user: User, completion: @escaping(FirestoneCompetion)) {
        let data: [String: Any] = [
            "uid":  user.uid,
            "comment": comment,
            "timestamp": Timestamp(date: Date()),
            "username": user.username,
            "profileImageUrl": user.profileImageUrl
            ]
        COLLECTION_POSTS.document(postID).collection(collection).addDocument(data: data, completion: completion)
    }
    
    static func fetchComments(forPost postID: String, completion: @escaping([Comment]) -> Void) {
        var comments = [Comment]()
        let query = COLLECTION_POSTS.document(postID).collection(collection)
        query.order(by: "timestamp", descending: true)
        
        query.addSnapshotListener { (snapshot, error) in
            snapshot?.documentChanges.forEach({ change in
                if change.type == .added {
                    let data = change.document.data()
                    let comment = Comment(dictionary: data)
                    comments.append(comment)
                }
            })
            
            completion(comments)
        }
        
    }
}
