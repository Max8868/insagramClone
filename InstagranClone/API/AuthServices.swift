//
//  AuthServices.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 05/12/22.
//

import Foundation
import UIKit
import Firebase

struct AuthCredentials {
    let email: String
    let password: String
    let fullname: String
    let username: String
    let profileImage: UIImage
}

struct AuthServices {
    
    static func registerUser(with credentials: AuthCredentials) {
        print("Debug: Credentials are \(credentials )")
    }
}
