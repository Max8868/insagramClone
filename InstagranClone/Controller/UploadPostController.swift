//
//  UploadPostController.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 26/01/23.
//

import Foundation
import UIKit

class UploadPostController: UIViewController {
    
    //MARK: - Properties
    
    private let photoImageView: UIImageView = {
        let iv  = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = UIImage(named: "venom-7")
        return iv
    }()
    
    private let captionTextView: UITextView = {
        let tv = UITextView()
        
        return tv
    }()
    
    private let charactereCount: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "0/100"
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Actions
    
    @objc func didTapCancel(sender: UIButton) {
        dismiss(animated: true)
    }
    
    @objc func didTapDone(sender: UIButton) {
        print("Debug: Share post here... ")
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Upload Post"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                           target: self,
                                                           action: #selector(didTapCancel(sender:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share",
                                                            style: .done, target: self,
                                                            action: #selector(didTapDone(sender:)))
        
        view.addSubview(photoImageView)
        photoImageView.setDimensions(height: 180, width: 180)
        photoImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        photoImageView.centerX(inView: view)
        photoImageView.layer.cornerRadius = 10
        
        view.addSubview(captionTextView)
        captionTextView.anchor(top: photoImageView.bottomAnchor,
                               left: view.leftAnchor,
                               right: view.rightAnchor,
                               paddingTop: 16,
                               paddingLeft: 12,
                               paddingRight: 12,
                               height: 64)
        
        view.addSubview(charactereCount)
        charactereCount.anchor(bottom: captionTextView.bottomAnchor, right: view.rightAnchor, paddingRight: 12)
    }
    
    
}
