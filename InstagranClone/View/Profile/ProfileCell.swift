//
//  ProfileCell.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 07/12/22.
//

import Foundation
import UIKit

class ProfileCell: UICollectionViewCell {
    
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
