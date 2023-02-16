//
//  Post.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 15/02/23.
//

import Firebase

struct Post {
    var caption: String
    var likes: Int
    let imageUrl: String
    let ownerUid: String
    let timestamp: Timestamp
    let postId: String
    let ownerImageUrl: String
    let ownerUsername: String
    
    init(postId: String, dict: [String: Any]) {
        self.caption = dict["caption"] as? String ?? ""
        self.likes = dict["likes"] as? Int ?? 0
        self.imageUrl = dict["imageUrl"] as? String ?? ""
        self.ownerUid = dict["ownerUid"] as? String ?? ""
        self.timestamp = dict["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        self.postId = postId
        self.ownerImageUrl = dict["ownerImageUrl"] as? String ?? ""
        self.ownerUsername = dict["ownerUsername"] as? String ?? ""
    }
}
