//
//  User.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 11/01/23.
//

import Foundation
import Firebase

struct User {
    
    let email, fullname, profileImageUrl, username, uid: String
    var isFollowed = false
    var stats: UserStats
    
    var isCurrentUser: Bool {
        return Auth.auth().currentUser?.uid == uid
    }
     
    init(dict: [String: Any]) {
        self.email = dict["email"] as? String ?? ""
        self.fullname = dict["fullname"] as? String ?? ""
        self.profileImageUrl = dict["profileImageUrl"] as? String ?? ""
        self.username = dict["username"] as? String ?? ""
        self.uid = dict["uid"] as? String ?? ""
        self.stats = UserStats(followers: 0, following: 0)
    }
}

struct UserStats {
    let followers: Int
    let following: Int
    // let posts: Int
}
