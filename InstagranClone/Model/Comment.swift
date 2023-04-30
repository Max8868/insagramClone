//
//  Comment.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 30/04/23.
//

import Firebase

struct Comment {
    let commentText: String
    let profileImageUrl: String
    let timestamp: Timestamp
    let uid: String
    let username: String
    
    init(dictionary: [String: Any]) {
        self.uid = dictionary["uid"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.commentText = dictionary["comment"] as? String ?? ""
    }
}
