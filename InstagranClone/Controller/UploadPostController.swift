//
//  UploadPostController.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 26/01/23.
//

import Foundation
import UIKit

protocol UploadPostControllerDelegate: AnyObject {
    func controllerDidFinishUploadingPost(_ controller: UIViewController)
}
class UploadPostController: UIViewController {
    
    //MARK: - Properties
    
    var delegate: UploadPostControllerDelegate?
    
    var selectedImage: UIImage? {
        didSet { photoImageView.image = selectedImage }
    }
    
    private let photoImageView: UIImageView = {
        let iv  = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private lazy var captionTextView: InputTextView = {
        let tv = InputTextView()
        tv.placeholderText = "Enter caption"
        tv.font = UIFont.systemFont(ofSize: 16)
        tv.delegate = self
        return tv
    }()
    
    private let charactereCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
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
        
        guard let selectedImage = selectedImage,
        let caption = captionTextView.text else { return }
        
        showLoader(true)
        
        PostService.uploadPost(caption: caption, image: selectedImage) { error in
            self.showLoader(false)
            if let error = error {
                print("Debug: Failed to upload post \(error.localizedDescription)")
                return
            }
            
            self.delegate?.controllerDidFinishUploadingPost(self)
        }
    }
    
    func checkMaxLength(_ textView: UITextView, maxLength: Int) {
        if (textView.text.count) > maxLength {
            textView.deleteBackward()
        }
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
        
        view.addSubview(charactereCountLabel)
        charactereCountLabel.anchor(bottom: captionTextView.bottomAnchor, right: view.rightAnchor, paddingRight: 12)
    }
    
    
}

// MARK: - UITextViewDelegate

extension UploadPostController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        checkMaxLength(textView, maxLength: 100)
        let count = textView.text.count
        charactereCountLabel.text = "\(count)/100"
    }
}
