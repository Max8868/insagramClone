//
//  PostViewModel.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 15/02/23.
//

import UIKit

struct PostViewModel {
    var post: Post
    
    var imageUrl: URL? { return URL(string: post.imageUrl) }
    
    var userProfileImageUrl: URL? { return URL(string: post.ownerImageUrl) }
    
    var user: String { return post.ownerUsername }
    
    var caption: String { return post.caption }
    
    var likes: Int { return post.likes }
    
    var likeButtonTintColor: UIColor {
        return post.didLike ? .red : .black
    }
    
    var likeButtonImage: UIImage?  {
        let imageName = post.didLike ? "like_selected" : "like_unselected"
        return UIImage(named: imageName)
    }
    
    var likeslabelString: String {
        return likes > 1 ? "\(likes) likes" : "\(likes) like"
    }
    
    init(post: Post) {
        self.post = post
    }
}
