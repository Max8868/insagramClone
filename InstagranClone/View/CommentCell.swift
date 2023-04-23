//
//  CommentCell.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 22/04/23.
//

import UIKit

class CommentCell: UICollectionViewCell {
    
    //MARK: - Properties
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .gray
        return iv
    }()
    
    private let commentLabel: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "Joker ", attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSMutableAttributedString(string: "Some test Comment for now",
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
}
