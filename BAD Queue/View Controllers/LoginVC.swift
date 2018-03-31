//
//  LoginVC.swift
//  BadUITest
//
//  Created by Derek Nguyen on 3/29/18.
//  Copyright © 2018 B Alpha Delta. All rights reserved.
//

import UIKit
import Firebase
import FacebookCore
import FacebookLogin
import GoogleSignIn
import JGProgressHUD

class LoginVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, GIDSignInUIDelegate  {
    
    var transformHeight = CGFloat(0.0)
    
    let hud: JGProgressHUD = {
        let hud = JGProgressHUD(style: JGProgressHUDStyle.dark)
        hud.interactionType = .blockAllTouches
        hud.vibrancyEnabled = true
        
        return hud
    }()
    
    var wallpaperImageView: UIImageView = {
        let wallpaperIV = UIImageView(image: System.wallpaper)
        wallpaperIV.contentMode = .scaleAspectFill
        wallpaperIV.layer.borderWidth = 2
        wallpaperIV.translatesAutoresizingMaskIntoConstraints = false
        return wallpaperIV
    }()
    
    var logoImageView: UIImageView = {
        let logoIV = UIImageView(image: System.logo)
        logoIV.contentMode = .scaleAspectFit
        logoIV.translatesAutoresizingMaskIntoConstraints = false
        logoIV.alpha = 0.0
        return logoIV
    }()
    
    var addPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "Camera Icon").withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = System.mainColor
        button.backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 0.3)
        button.layer.borderColor = System.mainColor.cgColor
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
        textField.tintColor = System.mainColor
        textField.textColor = .white
        textField.keyboardAppearance = .dark
        textField.backgroundColor = System.secondaryColor
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
        textField.tintColor = System.mainColor
        textField.textColor = .white
        textField.keyboardAppearance = .dark
        textField.backgroundColor = System.secondaryColor
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
        textField.tintColor = System.mainColor
        textField.textColor = .white
        textField.keyboardAppearance = .dark
        textField.backgroundColor = System.secondaryColor
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
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var socialStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var googleButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        button.showsTouchWhenHighlighted = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.alpha = 0.0
        button.addTarget(self, action: #selector(authenticateGoogle), for: .touchUpInside)
        return button
    }()
    
    var facebookButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        button.showsTouchWhenHighlighted = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.alpha = 0.0
        button.addTarget(self, action: #selector(authenticateFacebook), for: .touchUpInside)
        return button
    }()
    
    var authenticateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = System.mainColor
        button.layer.cornerRadius = 5
        button.setTitle("Sign In", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.alpha = 0.0
        button.addTarget(self, action: #selector(authenticateEmail), for: .touchUpInside)
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
        gradientLayer.colors = System.mainGradientColors
        return gradientLayer
    }()
    
    @objc fileprivate func getProfilePhoto() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @objc fileprivate func toggleMode() {
        System.toggleMode()
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
        
        System.resetSpecialCount()
        GIDSignIn.sharedInstance().uiDelegate = self
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(notification:)),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil)
        
        if view.frame.height < 568 {
            System.iPhone4Mode()
        }
        
        setupUI()
    }
    
}

extension LoginVC {
    
    @objc fileprivate func authenticateEmail() {
        authenticateButton.backgroundColor = System.secondaryColor
        authenticateButton.isEnabled = false
        
        if System.isSignInMode {
            signInEmail()
        }
        else {
            signUpEmail()
        }
    }
    
    fileprivate func signInEmail() {
        guard let email = emailTextField.text else { /* TODO: DETECT EMPTY */ return }
        guard let password = passwordTextField.text else { /* TODO: DETECT EMPTY */ return }
        
        Auth.auth().signIn(withEmail: email, password: password) {
            [weak self] (user, error) in
            
            guard let this = self else { return }
            
            if let err = error {
                
                // TODO: PARSE ERROR
                print("Login Error: \n", err)
                this.authenticateButton.backgroundColor = System.mainColor
                this.authenticateButton.isEnabled = true
            }
            else {
                // TODO: PROCEED AFTER LOG IN SUCCESSFULLY
                print("Login Success!")
                this.authenticateButton.backgroundColor = System.mainColor
                this.authenticateButton.isEnabled = true
                
                // TODO: REMOVE
                do {
                    try Auth.auth().signOut()
                    print("Signed out!")
                } catch {
                    print("Log Out error")
                }
            }
        }
    }
    
    
    fileprivate func signUpEmail() {
        
        hud.textLabel.text = "Creating Account..."
        prepScreen(alpha: 0.0)
        hud.show(in: view, animated: true)
        
        guard let fullName = fullNameTextField.text else { /* TODO: DETECT EMPTY */ return }
        guard let email = emailTextField.text else { /* TODO: DETECT EMPTY */ return }
        guard let password = passwordTextField.text else { /* TODO: DETECT EMPTY */ return }
        
        Auth.auth().createUser(withEmail: email, password: password) {
            [weak self] (user, error) in
            
            guard let this = self else { return }
            
            if let err = error {
                
                // TODO: PARSE ERROR
                print("Create Account Error: \n", err)
            }
            else {
                // TODO: PROCEED AFTER CREATE SUCCESSFULLY
                print("Create User Success!")

                
                // TODO: REMOVE
                do {
                    try Auth.auth().signOut()
                    print("Signed out!")
                } catch {
                    print("Log Out error")
                }
            }
       
            this.authenticateButton.backgroundColor = System.mainColor
            this.authenticateButton.isEnabled = true
            
            this.hud.dismiss(animated: true)
            this.prepScreen(alpha: 1.0, delay: 0.5)

        
        }
        
    }
}

extension LoginVC {
    @objc fileprivate func authenticateGoogle() {
        GIDSignIn.sharedInstance().signIn()
    }
    
    @objc fileprivate func authenticateFacebook() {
        if System.isSignInMode {
            let manager = LoginManager(loginBehavior: .native, defaultAudience: .onlyMe)
            
            manager.logIn(readPermissions: [.publicProfile, .email], viewController: self) {
                [weak self] (loginResult) in
                
                guard let this = self else { return }
                
                switch loginResult {
                    
                case .success(grantedPermissions: _, declinedPermissions: _, token: _):
                    // TODO: FILL IN PARAMETERS FOR SUCCESS FB LOGIN
                    this.hud.textLabel.text = "Signing In"
                    this.prepScreen(alpha: 0.0)
                    this.hud.show(in: this.view, animated: true)
                    this.firebaseLogin()
                    
                case .cancelled:
                    // TODO: HANDLE USER CANCEL FB LOGIN ATTEMPT
                    print("User cancel FB Login attempt.")
                    
                case .failed(let error):
                    print("FB Login Error: \n", error)

                }
            }
        }
    }
    
    fileprivate func firebaseLogin() {
        guard let authToken = AccessToken.current?.authenticationToken else { return }
        let authCredential = FacebookAuthProvider.credential(withAccessToken: authToken)
        
        Auth.auth().signIn(with: authCredential) {
            [weak self](user, error) in
            
            guard let this = self else { return }
            if let err = error {
                print("Facebook -> Firebase Login Error: ", err)
            }
            else {
                print("Facebook -> Firebase Login Success")
                this.hud.dismiss(animated: true)
                this.prepScreen(alpha: 1.0, delay: 0.5)
                
                print("Signing Out")
                try? Auth.auth().signOut()

            }
        }
    }
    
}








