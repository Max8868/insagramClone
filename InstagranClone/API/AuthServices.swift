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
    
    static func registerUser(with credentials: AuthCredentials, completion: @escaping(Error?) -> Void) {
        print("Debug: Credentials are \(credentials)")
        
        ImageUploader.uploadImage(image: credentials.profileImage) { imageUrl in
            
            Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) { (result, error) in
                if let error = error {
                    print("Debug: Failed to register user \(error.localizedDescription)")
                    return
                }
                
                guard let uid = result?.user.uid else { return }
                
                let data: [String: Any] = ["email": credentials.email,
                                           "fullname": credentials.fullname,
                                           "profileImageUrl": imageUrl,
                                           "uid": uid,
                                           "username": credentials.username]
                
                Firestore.firestore().collection("users").document(uid).setData(data, completion: completion)
            }
            
        }
    }
}
