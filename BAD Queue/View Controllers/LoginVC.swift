//
//  LoginVC.swift
//  BAD Queue
//
//  Created by Derek Nguyen on 3/26/18.
//  Copyright © 2018 B Alpha Delta. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    var isSignUp = true
    var fontSize: CGFloat = 15.0
    var signInModePrompt: NSMutableAttributedString?
    var signUpModePrompt: NSMutableAttributedString?
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var authenticateButton: UIButton!
    @IBOutlet weak var toggleModeButton: UIButton!
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var logoWidthConstraint: NSLayoutConstraint!
    
    @IBAction func toggleMode(_ sender: UIButton) {
        
        isSignUp = !isSignUp
        changeText()
        print(isSignUp)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.view.frame.height < 568 {
            setupUISmallDevice()
        }
        
        self.setupGradientBG()
        self.setUpTextField()
        self.setupFacebookBtn()
        self.setupGoogleBtn()
        self.setupPhotoButton()
        self.setupToggleModeBtn()
        self.authenticateButton.layer.cornerRadius = 5
        
    }
}

// MARK: Mode Logic
extension LoginVC {
    
    fileprivate func changeText() {
        if !isSignUp {
            self.authenticateButton.titleLabel?.adjustsFontSizeToFitWidth = true
            self.authenticateButton.setTitle("Sign Up", for: .normal)
            self.toggleModeButton.setAttributedTitle(self.signInModePrompt, for: .normal)
        }
        else {
            self.authenticateButton.titleLabel?.adjustsFontSizeToFitWidth = true
            self.authenticateButton.setTitle("Sign In", for: .normal)
            self.toggleModeButton.setAttributedTitle(self.signUpModePrompt, for: .normal)
        }
    }
    
}

// MARK: UI Extension
extension LoginVC {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    fileprivate func setUpTextField() {
        self.fullNameTextField.setupTextField(leftImage: #imageLiteral(resourceName: "User Icon"), placeHolder: "Full Name", fontSize: self.fontSize)
        self.emailTextField.setupTextField(leftImage: #imageLiteral(resourceName: "Email Icon"), placeHolder: "Email", fontSize: self.fontSize)
        self.passwordTextField.setupTextField(leftImage: #imageLiteral(resourceName: "Lock Icon"), placeHolder: "Password", fontSize: self.fontSize)
    }
    
    fileprivate func setupUISmallDevice() {
        self.fontSize = 9.0
        self.authenticateButton.titleLabel?.font = UIFont.systemFont(ofSize: self.fontSize)
        self.orLabel.font = UIFont.systemFont(ofSize: self.fontSize)
        self.logoWidthConstraint.setMultiplier(multiplier: 0.7)
    }
    
    fileprivate func setupGradientBG() {
        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor, #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor]
        gradientLayer.colors = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor, #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor]
        gradientLayer.frame = self.view.frame
        self.view.layer.insertSublayer(gradientLayer, at: 1)
    }
    
    fileprivate func setupFacebookBtn() {
        self.facebookButton.layer.cornerRadius = 5
        
        let imageView = UIImageView(frame: CGRect(origin: self.facebookButton.center,
                                                  size: CGSize(width: self.facebookButton.frame.width * 0.7,
                                                               height: self.facebookButton.frame.height * 0.7)))
        imageView.image = #imageLiteral(resourceName: "Facebook f")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.facebookButton.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: self.facebookButton.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.facebookButton.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: imageView.frame.width * 0.8).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: imageView.frame.width * 0.8).isActive = true
    }
    
    fileprivate func setupGoogleBtn() {
        self.googleButton.layer.cornerRadius = 5
        
        let imageView = UIImageView(frame: CGRect(origin: self.googleButton.center,
                                                  size: CGSize(width: self.googleButton.frame.width * 0.7,
                                                               height: self.googleButton.frame.height * 0.7)))
        imageView.image = #imageLiteral(resourceName: "Google Logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.googleButton.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: self.googleButton.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.googleButton.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: imageView.frame.width * 0.8).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: imageView.frame.width * 0.8).isActive = true

    }
    
    
    fileprivate func setupToggleModeBtn() {
        self.signUpModePrompt = NSMutableAttributedString(string: "Don't have an account? ",
                                                          attributes: [.foregroundColor: UIColor.white])
        
        let attributedSignUp = NSMutableAttributedString(string: "Sign Up.",
                                                         attributes: [
                                                            .foregroundColor: #colorLiteral(red: 0.568627451, green: 0.09803921569, blue: 0.06666666667, alpha: 1),
                                                            .font: UIFont.boldSystemFont(ofSize: self.fontSize)])
        
        
        self.signInModePrompt = NSMutableAttributedString(string: "Already have an account? ",
                                                          attributes: [.foregroundColor: UIColor.white])
        
        let attributedSignIn = NSMutableAttributedString(string: "Sign In.",
                                                         attributes: [
                                                            .foregroundColor: #colorLiteral(red: 0.568627451, green: 0.09803921569, blue: 0.06666666667, alpha: 1),
                                                            .font: UIFont.boldSystemFont(ofSize: self.fontSize)])
        
        
        self.signUpModePrompt?.append(attributedSignUp)
        self.signInModePrompt?.append(attributedSignIn)
        
        self.toggleModeButton.setAttributedTitle(signInModePrompt, for: .normal)
    }
    
    fileprivate func setupPhotoButton() {
        self.addPhotoButton.setImage(#imageLiteral(resourceName: "Camera Icon").withRenderingMode(UIImageRenderingMode.alwaysOriginal), for: UIControlState.normal)
        self.addPhotoButton.layer.borderWidth = 1
        self.addPhotoButton.layer.borderColor = #colorLiteral(red: 0.568627451, green: 0.09803921569, blue: 0.06666666667, alpha: 1)
        self.addPhotoButton.layer.cornerRadius = 5
    }

}

