//
//  RegistrationController.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 25/05/22.
//

import UIKit

class RegistrationController: UIViewController {
    
    //MARK: - Properties
    
    private let plushPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        let image = #imageLiteral(resourceName: "plus_photo")
        button.setImage(image, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let emailTextField = CustonTextField(placeholder: "Email", type: .email)
    private let passwordTextField = CustonTextField(placeholder: "Password", type: .password)
    private let fullNameTextField = CustonTextField(placeholder: "FullName", type: .fullName)
    private let usernameTextField = CustonTextField(placeholder: "Username", type: .username)
    private let signUpButton = CustonButton(title: "Sign Up")
    
    private let alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Already have an account?", secondPart: "Sign Up")
        button.addTarget(self, action: #selector(handleShowLogin(sender:)), for: .touchUpInside)
        return button
    }()
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }

    // MARK: - Actions
    @objc private func handleShowLogin(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helpers
    func configureUI() {
        configureGradientLayer()
        view.addSubview(plushPhotoButton)
        plushPhotoButton.centerX(inView: view)
        plushPhotoButton.setDimensions(height: 140, width: 140)
        plushPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        let stack = UIStackView(arrangedSubviews: [emailTextField,
                                                   passwordTextField,
                                                   fullNameTextField,
                                                   usernameTextField,
                                                   signUpButton])
        stack.axis = .vertical
        stack.spacing = 20
        view.addSubview(stack)
        stack.anchor(top: plushPhotoButton.bottomAnchor,
                     left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingTop: 32,
                     paddingLeft: 32,
                     paddingRight: 32)
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.centerX(inView: view)
        alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
    
    
    
}
