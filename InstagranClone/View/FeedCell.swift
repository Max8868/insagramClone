//
//  FeedCell.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 10/05/22.
//

import UIKit

protocol FeedCellDelegate: AnyObject {
    func cell(_ cell: FeedCell, wantsShowComments post: Post)
    func cell(_ cell: FeedCell, didLike post: Post)
}

class FeedCell: UICollectionViewCell {
    
    // MARK: - Proprities
    
    var viewModel: PostViewModel? {
        didSet { configure() }
    }
    
    weak var delegate: FeedCellDelegate?
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.backgroundColor = .systemPurple
        return iv
    }()
    
    private lazy var usernameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.addTarget(self, action: #selector(didTapUsernameButton(sender:)), for: .touchUpInside)
        return button
    }()
    
    private let postImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        return iv
    }()
    
    lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "like_unselected")!, for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(didTapLikeButton(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "comment")!, for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(didTapCommentsButton(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "send2")!, for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(didTapShareButton(sender:)), for: .touchUpInside)
        return button
    }()
    
    private let likeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let postTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "2 days ago"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
        
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor,
                                left: leftAnchor,
                                paddingTop: 12,
                                paddingLeft: 12)
        profileImageView.setDimensions(height: 40, width: 40)
        profileImageView.layer.cornerRadius = 40 / 2
        
        addSubview(usernameButton)
        usernameButton.centerY(inView: profileImageView,
                               leftAnchor: profileImageView.rightAnchor,
                               paddingLeft: 8)
        
        addSubview(postImageView)
        postImageView.anchor(top: profileImageView.bottomAnchor,
                             left: leftAnchor,
                             right: rightAnchor,
                             paddingTop: 8)
        postImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        
        configureActionButtons()
        
        addSubview(likeLabel)
        likeLabel.anchor(top: likeButton.bottomAnchor,
                         left: leftAnchor,
                         paddingTop: -4,
                         paddingLeft: 8)
        
        addSubview(captionLabel)
        captionLabel.anchor(top: likeLabel.bottomAnchor,
                            left: leftAnchor,
                            paddingTop: 8,
                            paddingLeft: 8)
        addSubview(postTimeLabel)
        postTimeLabel.anchor(top: captionLabel.bottomAnchor,
                            left: leftAnchor,
                            paddingTop: 8,
                            paddingLeft: 8)
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: - Actions
    
    @objc
    func didTapUsernameButton(sender: UIButton) {
        print("DEBUG: did tap username")
    }
    
    @objc
    func didTapLikeButton(sender: UIButton) {
        guard let viewModel else { return }
        delegate?.cell(self, didLike: viewModel.post)
    }
    
    @objc
    func didTapCommentsButton(sender: UIButton) {
        guard let viewModel else { return }
        delegate?.cell(self, wantsShowComments: viewModel.post)
    }
    
    @objc
    func didTapShareButton(sender: UIButton) {
        print("DEBUG: did tap share")
    }
    
    // MARK: - Helpers
    
    func configure() {
        guard let viewModel = viewModel else { return }
        captionLabel.text = viewModel.caption
        postImageView.sd_setImage(with: viewModel.imageUrl)
        profileImageView.sd_setImage(with: viewModel.userProfileImageUrl)
        usernameButton.setTitle(viewModel.user, for: .normal)
        likeLabel.text = viewModel.likeslabelString 
    }

    func configureActionButtons() {
       let stackView = UIStackView(arrangedSubviews: [likeButton, commentButton, shareButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.anchor(top: postImageView.bottomAnchor, width: 120, height: 50)
    }
}
