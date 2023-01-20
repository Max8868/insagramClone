//
//  ProfileHeaderViewModel.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 11/01/23.
//

import Foundation
import UIKit


struct ProfileHeaderViewModel {
    
    let user: User
    
    var fullName: String {
        return user.fullname
    }
    
    var profileImageUrl: URL? {
        return URL(string: user.profileImageUrl)
    }
    
    var followButtonText: String {
        
        if user.isCurrentUser {
            return "Edit Profile"
        }
        return user.isFollowed ? "Following" : "Follow"
    }
    
    var followButtonBackgroundColor: UIColor {
        return user.isCurrentUser ? .white : .systemBlue
    }
    
    var followButtonTextColor: UIColor {
        return user.isCurrentUser ? .black : .white
    }
    
    var numberOfFollowers: NSAttributedString {
        return atrributedStackText(value: user.stats.followers, label: user.stats.followers > 1 ? "followers" : "follower")
    }
    
    var numberOfFollowing: NSAttributedString {
        return atrributedStackText(value: user.stats.following, label: "following")
    }
    
    var numberOfPosts: NSAttributedString {
        return atrributedStackText(value: 9, label: "posts")
    }
    
    init(user: User) {
        self.user = user
    }
    
    func atrributedStackText(value: Int, label: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: "\(value)\n", attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSMutableAttributedString(string: label, attributes: [.font: UIFont.systemFont(ofSize: 14),
                                                                                    .foregroundColor: UIColor.lightGray]))
        return attributedText
    }
}
