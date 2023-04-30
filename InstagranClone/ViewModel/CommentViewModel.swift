//
//  CommentViewModel.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 30/04/23.
//

import UIKit

struct CommentViewModel {
    
    private let comment: Comment
    var profileImageUrl: URL? { return URL(string: comment.profileImageUrl) }
    
    init(comment: Comment) {
        self.comment = comment
    }
    
    func commentLabelText() -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: "\(comment.username) ", attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSMutableAttributedString(string: comment.commentText,
                                                        attributes: [.font: UIFont.systemFont(ofSize: 14)]))
        return attributedText
    }
    
    func size(forWidth width: CGFloat) -> CGSize {
        
        let label = UILabel()
        label.numberOfLines = 0
        label.text = comment.commentText
        label.lineBreakMode = .byWordWrapping
        label.setWidth(width)
        return label.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
}
