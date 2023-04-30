//
//  CommentCell.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 22/04/23.
//

import UIKit

class CommentCell: UICollectionViewCell {
     
    //MARK: - Properties
    private var username: String = ""
    private var commentText: String = ""
      
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .gray
        return iv
    }()
    
    private lazy var commentLabel: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "\(self.username) ", attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSMutableAttributedString(string: self.commentText,
                                                        attributes: [.font: UIFont.systemFont(ofSize: 14)]))
        label.attributedText = attributedText
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(profileImageView)
        profileImageView.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 8)
        profileImageView.setDimensions(height: 40, width: 40)
        profileImageView.layer.cornerRadius = 20
        
        addSubview(commentLabel)
        commentLabel.centerY(inView:  profileImageView, leftAnchor:  profileImageView.rightAnchor, paddingLeft: 12)
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        return nil
    }
    
    func setup(_ comment: Comment) {
        self.username = comment.username
        self.commentText = comment.commentText
        //profileImageView.sd_setImage(with: comment.profileImageUrl)
    }
}
