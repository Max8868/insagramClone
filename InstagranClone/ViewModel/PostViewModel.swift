//
//  PostViewModel.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 15/02/23.
//

import Foundation

struct PostViewModel {
    private let posts: Post
    
    var imageUrl: URL? { return URL(string: posts.imageUrl) }
    
    var userProfileImageUrl: URL? { return URL(string: posts.ownerImageUrl) }
    
    var user: String { return posts.ownerUsername }
    
    var caption: String { return posts.caption }
    
    var likes: Int { return posts.likes }
    
    var likeslabelString: String {
        return likes > 1 ? "\(likes) likes" : "\(likes) like"
    }
    
    init(posts: Post) {
        self.posts = posts
    }
}
