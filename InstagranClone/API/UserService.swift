//
//  UserService.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 11/01/23.
//

import Firebase

typealias FirestoneCompetion = (Error?) -> Void

struct UserService {
    
    static func fetchUser(completion: @escaping(User) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            guard let dict = snapshot?.data() else { return }
            let user = User(dict: dict)
            completion(user)
        }
    }
    
    static func fetchUsers(completion: @escaping([User]) -> Void) {
        COLLECTION_USERS.getDocuments { snapshot, error in
            guard let snapshot = snapshot else { return }
            let users = snapshot.documents.map({ User(dict: $0.data()) })
            completion(users)
        }
    }
    
    static func followUser(uid: String, completion: @escaping(FirestoneCompetion)) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(uid).setData([:]) { error in
            COLLECTION_FOLLOWERS.document(uid).collection("user-followers").document(currentUid).setData([:], completion: completion)
        }
    }
    
    static func unfollowUser(uid: String, completion: @escaping(FirestoneCompetion)) {
        
    }
}
