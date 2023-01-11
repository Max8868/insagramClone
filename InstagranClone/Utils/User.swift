//
//  User.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 11/01/23.
//

import Foundation

struct User {
    let email, fullname, profileImageUrl, username, uid: String
    
    init(dict: [String: Any]) {
        self.email = dict["email"] as? String ?? ""
        self.fullname = dict["fullname"] as? String ?? ""
        self.profileImageUrl = dict["profileImageUrl"] as? String ?? ""
        self.username = dict["username"] as? String ?? ""
        self.uid = dict["uid"] as? String ?? ""
    }
}
