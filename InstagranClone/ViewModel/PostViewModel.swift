//
//  PostViewModel.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 15/02/23.
//

import Foundation

struct PostViewModel {
    var post: Post
    
    var imageUrl: URL? { return URL(string: post.imageUrl) }
    
    var userProfileImageUrl: URL? { return URL(string: post.ownerImageUrl) }
    
    var user: String { return post.ownerUsername }
    
    var caption: String { return post.caption }
    
    var likes: Int { return post.likes }
    
    var likeslabelString: String {
        return likes > 1 ? "\(likes) likes" : "\(likes) like"
    }
    
    init(post: Post) {
        self.post = post
    }
}
