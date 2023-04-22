//
//  ProfileCell.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 07/12/22.
//

import Foundation
import UIKit

class ProfileCell: UICollectionViewCell {

    var viewModel: PostViewModel? {
        didSet {
            configure()
        }
    }

    //MARK: - Properties
    private let postImage: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "venom-7"))
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        
        addSubview(postImage)
        postImage.fillSuperview()
    }
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        return nil
    }
    
    func configure() {
        guard let viewModel else { return }
        postImage.sd_setImage(with: viewModel.imageUrl)
    }
}
