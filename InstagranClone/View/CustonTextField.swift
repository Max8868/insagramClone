//
//  CustonTextField.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 27/11/22.
//

import Foundation
import UIKit

enum CustonTextFieldType {
    case email
    case password
    case fullName
    case username
}

class CustonTextField: UITextField {
    
    init(placeholder: String, type: CustonTextFieldType) {
        super.init(frame: .zero)
        let imageView = UIImageView()
        imageView.setDimensions(height: 35, width: 35)
        imageView.tintColor = .white
        switch type {
        case .email:
            imageView.image = UIImage(systemName: "envelope")
            keyboardType = .emailAddress
        case .password:
            imageView.image = UIImage(systemName: "lock")
            isSecureTextEntry = true
        case .fullName:
            imageView.image = UIImage(systemName: "person")
        case .username:
            imageView.image = UIImage(systemName: "person.text.rectangle")
        }
        
        imageView.contentMode = .scaleAspectFit
        
        let view = UIView()
        view.addSubview(imageView)
        imageView.center(inView: view)
        view.setDimensions(height: 50, width: 50)
        leftView = view
        leftViewMode = .always
        
        borderStyle = .none
        textColor = .white
        keyboardAppearance = .dark
        keyboardType = .emailAddress
        backgroundColor = UIColor(white: 1, alpha: 0.1)
        setHeight(50)
        attributedPlaceholder = NSAttributedString(string: placeholder,
                                                   attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
