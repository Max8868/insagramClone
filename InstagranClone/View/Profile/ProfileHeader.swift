//
//  ProfileHeader.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 07/12/22.
//

import Foundation
import UIKit

class ProfileHeader: UICollectionReusableView {
    
    //MARK: - Properties
    
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemPink
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
