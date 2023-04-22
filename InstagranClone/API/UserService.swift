//
//  UserService.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 11/01/23.
//

import Firebase

typealias FirestoneCompetion = (Error?) -> Void

struct UserService {
    
    enum UserPaths: String {
        case userFollowing = "user-following"
        case userFollowers = "user-followers"
    }
    
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
        COLLECTION_FOLLOWING.document(currentUid).collection(UserPaths.userFollowing.rawValue).document(uid).setData([:]) { error in
            COLLECTION_FOLLOWERS.document(uid).collection(UserPaths.userFollowers.rawValue).document(currentUid).setData([:], completion: completion)
        }
    }
    
    static func unfollowUser(uid: String, completion: @escaping(FirestoneCompetion)) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_FOLLOWING.document(currentUid).collection(UserPaths.userFollowing.rawValue).document(uid).delete { error in
            COLLECTION_FOLLOWERS.document(uid).collection(UserPaths.userFollowers.rawValue).document(currentUid).delete(completion: completion)
        }
    }
    
    static func checkIfUserIsFollowed(uid: String, completion: @escaping(Bool) -> Void) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        COLLECTION_FOLLOWING.document(currentUid).collection(UserPaths.userFollowing.rawValue).document(uid).getDocument { snapshot, error in
            guard let isfollowed = snapshot?.exists else { return }
            completion(isfollowed)
        }
    }
    
    static func fetchUserStats(uid: String, completion: @escaping(UserStats) -> Void) {
        COLLECTION_FOLLOWERS.document(uid).collection(UserPaths.userFollowers.rawValue).getDocuments { snapshot, _  in
            let followers = snapshot?.documents.count ?? 0
            
            COLLECTION_FOLLOWING.document(uid).collection(UserPaths.userFollowing.rawValue).getDocuments { snapshot, _  in
                let following = snapshot?.documents.count ?? 0
                
                COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, _ in
                    let posts = snapshot?.documents.count ?? 0
                    completion(UserStats(followers: followers, following: following, posts: posts))
                }
            }
        }
    }
}
