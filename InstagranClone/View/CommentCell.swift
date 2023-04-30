//
//  CommentCell.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 22/04/23.
//

import UIKit

class CommentCell: UICollectionViewCell {
     
    //MARK: - Properties
    var viewModel: CommentViewModel? {
        didSet {
            configure()
        }
    }
      
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .gray
        return iv
    }()
    
    private lazy var commentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
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
        commentLabel.anchor(right: rightAnchor, paddingRight: 8)
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        return nil
    }

    private func configure() {
        guard let viewModel else { return }
        profileImageView.sd_setImage(with: viewModel.profileImageUrl )
        commentLabel.attributedText = viewModel.commentLabelText()  
    }
}
