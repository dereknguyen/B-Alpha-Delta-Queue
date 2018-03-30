//
//  LoginVC.swift
//  BadUITest
//
//  Created by Derek Nguyen on 3/29/18.
//  Copyright © 2018 B Alpha Delta. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    var scale = CGFloat(0.85)
    var fontSize = CGFloat(14.0)
    var isSignIn = true
    var transformHeight = CGFloat(0.0)
    var specialCount = 0
    var specialOn = false
    var color = #colorLiteral(red: 0.6218340993, green: 0, blue: 0, alpha: 1)
    
    var wallpaperImageView: UIImageView = {
        let wallpaperIV = UIImageView(image: #imageLiteral(resourceName: "Wallpaper1").withRenderingMode(.alwaysOriginal))
        wallpaperIV.contentMode = .scaleAspectFill
        wallpaperIV.layer.borderWidth = 2
        wallpaperIV.translatesAutoresizingMaskIntoConstraints = false
        return wallpaperIV
    }()
    
    var logoImageView: UIImageView = {
        let logoIV = UIImageView(image: #imageLiteral(resourceName: "Logo").withRenderingMode(.alwaysOriginal))
        logoIV.contentMode = .scaleAspectFit
        logoIV.translatesAutoresizingMaskIntoConstraints = false
        logoIV.alpha = 0.0
        return logoIV
    }()
    
    var addPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "Camera Icon").withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = #colorLiteral(red: 0.568627451, green: 0.09803921569, blue: 0.06666666667, alpha: 1)
        button.backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 0.3)
        button.layer.borderColor = #colorLiteral(red: 0.568627451, green: 0.09803921569, blue: 0.06666666667, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.center = button.center
        button.alpha = 0.0
        button.addTarget(self, action: #selector(getProfilePhoto), for: .touchUpInside)
        return button
    }()
    
    var fullNameTextField: UITextField = {
        let textField = UITextField()
        textField.autocorrectionType = .yes
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.textContentType = UITextContentType("")
        textField.tintColor = #colorLiteral(red: 0.568627451, green: 0.09803921569, blue: 0.06666666667, alpha: 1)
        textField.textColor = .white
        textField.keyboardAppearance = .dark
        textField.backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 0.8)
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.alpha = 0.0

        return textField
    }()
    
    var emailTextField: UITextField = {
        let textField = UITextField()
        textField.autocorrectionType = .yes
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.textContentType = UITextContentType("")
        textField.tintColor = #colorLiteral(red: 0.568627451, green: 0.09803921569, blue: 0.06666666667, alpha: 1)
        textField.textColor = .white
        textField.keyboardAppearance = .dark
        textField.backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 0.8)
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.alpha = 0.0
        textField.textContentType = UITextContentType("")

        return textField
    }()
    
    
    var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.autocorrectionType = .yes
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.textContentType = UITextContentType("")
        textField.tintColor = #colorLiteral(red: 0.568627451, green: 0.09803921569, blue: 0.06666666667, alpha: 1)
        textField.textColor = .white
        textField.keyboardAppearance = .dark
        textField.backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 0.8)
        textField.borderStyle = .none
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.alpha = 0.0
        return textField
    }()
    
    var orLabel: UILabel = {
        let label = UILabel()
        label.text = "O R   W I T H"
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 0.0
        return label
    }()
    
    var credentialStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    var googleButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        button.showsTouchWhenHighlighted = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.alpha = 0.0
        return button
    }()
    
    var facebookButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        button.showsTouchWhenHighlighted = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.alpha = 0.0
        return button
    }()
    
    var authenticateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.568627451, green: 0.09803921569, blue: 0.06666666667, alpha: 1)
        button.layer.cornerRadius = 5
        button.setTitle("Sign In", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.alpha = 0.0
        return button
    }()
    
    var signUpModePrompt: NSMutableAttributedString?
    var signInModePrompt: NSMutableAttributedString?
    
    var toggleModeButton: UIButton = {
        let button = UIButton()
        button.adjustsImageWhenHighlighted = true
        button.adjustsImageWhenDisabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.alpha = 0.0
        button.addTarget(self, action: #selector(toggleMode), for: .touchUpInside)
        return button
    }()
    
    var gradient: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor, #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor]
        return gradientLayer
    }()
    
    @objc fileprivate func getProfilePhoto() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @objc fileprivate func toggleMode() {
        isSignIn = !isSignIn
        changeText()
    }
    
    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        if let info = notification.userInfo {
            
            guard let keyboardFrame = info[UIKeyboardFrameEndUserInfoKey] as? CGRect else { return }
            guard let curve = info[UIKeyboardAnimationCurveUserInfoKey] as? UInt else { return }
            self.view.layoutIfNeeded()

            let credStackY = CGFloat(keyboardFrame.origin.y - 8 - credentialStackView.frame.height - credentialStackView.frame.origin.y)
            let fullNameY = CGFloat(keyboardFrame.origin.y - 8 - credentialStackView.frame.height - 8 - fullNameTextField.frame.height - fullNameTextField.frame.origin.y)
            
            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: UIViewAnimationOptions(rawValue: curve), animations: {

                self.logoImageView.alpha = 0.0
                self.addPhotoButton.alpha = 0.0
                self.orLabel.alpha = 0.0
                self.facebookButton.alpha = 0.0
                self.googleButton.alpha = 0.0
                self.authenticateButton.alpha = 0.0
                self.toggleModeButton.alpha = 0.0
                self.credentialStackView.transform = CGAffineTransform(translationX: 0, y: credStackY)
                self.fullNameTextField.transform = CGAffineTransform(translationX: 0, y: fullNameY)
                
            }, completion: { (_) in
                
                self.addPhotoButton.isEnabled = false
                self.facebookButton.isEnabled = false
                self.googleButton.isEnabled = false
                self.authenticateButton.isEnabled = false
                self.toggleModeButton.isEnabled = false
                
            })
        }
    }
    
    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
        if let info = notification.userInfo {

            self.addPhotoButton.isEnabled = true
            self.facebookButton.isEnabled = true
            self.googleButton.isEnabled = true
            self.authenticateButton.isEnabled = true
            self.toggleModeButton.isEnabled = true
            
            guard let curve = info[UIKeyboardAnimationCurveUserInfoKey] as? UInt else { return }
            
            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: UIViewAnimationOptions(rawValue: curve), animations: {
                
                self.logoImageView.alpha = 1.0
                self.addPhotoButton.alpha = 1.0
                self.orLabel.alpha = 1.0
                self.facebookButton.alpha = 1.0
                self.googleButton.alpha = 1.0
                self.authenticateButton.alpha = 1.0
                self.toggleModeButton.alpha = 1.0
                self.credentialStackView.transform = CGAffineTransform(translationX: 0, y: 0)
                self.fullNameTextField.transform = CGAffineTransform(translationX: 0, y: 0)
                
            }, completion: nil)
        }
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let edittedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            addPhotoButton.setImage(edittedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            addPhotoButton.setImage(originalImage.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        
        addPhotoButton.imageView?.contentMode = .scaleAspectFill
        addPhotoButton.layer.masksToBounds = true
        
        dismiss(animated: true, completion: nil)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        specialCount = 0
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(notification:)),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil)
        
        if view.frame.height < 568 {
            scale = 0.7
            fontSize = 12.0
        }
        
        setupUI()
    }
    
    
}


