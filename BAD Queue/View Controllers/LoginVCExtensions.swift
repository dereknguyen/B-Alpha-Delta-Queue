//
//  LoginVCExtensions.swift
//  BAD Queue
//
//  Created by Derek Nguyen on 3/29/18.
//  Copyright © 2018 B Alpha Delta. All rights reserved.
//

import UIKit

extension LoginVC {
    
    func setupUI() {
        setupWallpaper()
        setupLogo()
        setupPhotoButton()
        setupInputTextFields()
        setupOrLabel()
        setupSocialButtons()
        setupAuthButton()
        setupToggleModeButton()
        view.layoutIfNeeded()
        readyPosition()
    }
    
    private func readyPosition() {
        
        let logoHeight = self.logoImageView.frame.height
        let fullNameHeight = self.fullNameTextField.frame.height
        transformHeight = CGFloat(logoHeight + fullNameHeight + 2 * 8)
        
        emailTextField.transform = CGAffineTransform(translationX: 0, y: view.frame.height / 5)
        passwordTextField.transform = CGAffineTransform(translationX: 0, y: view.frame.height / 5)
        orLabel.transform = CGAffineTransform(translationX: 0, y: view.frame.height / 5)
        facebookButton.transform = CGAffineTransform(translationX: 0, y: view.frame.height / 5)
        googleButton.transform = CGAffineTransform(translationX: 0, y: view.frame.height / 5)
        authenticateButton.transform = CGAffineTransform(translationX: 0, y: view.frame.height / 5)
        toggleModeButton.transform = CGAffineTransform(translationX: 0, y: view.frame.height / 5)
        addPhotoButton.transform = CGAffineTransform(translationX: view.frame.width, y: 0)
        fullNameTextField.transform = CGAffineTransform(translationX: view.frame.width, y: 0)
        
        UIView.animate(withDuration: 1.0, delay: 0.5, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.logoImageView.alpha = 1.0
            self.logoImageView.transform = CGAffineTransform(translationX: 0, y: self.transformHeight)
        }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 0.6, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.emailTextField.alpha = 1.0
            self.emailTextField.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 0.7, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.passwordTextField.alpha = 1.0
            self.passwordTextField.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 0.8, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.orLabel.alpha = 1.0
            self.orLabel.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 0.9, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.facebookButton.alpha = 1.0
            self.facebookButton.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 1.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.googleButton.alpha = 1.0
            self.googleButton.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 1.1, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.authenticateButton.alpha = 1.0
            self.authenticateButton.transform = CGAffineTransform(translationX: 0, y: 0)
            
        }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 1.2, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.toggleModeButton.alpha = 1.0
            self.toggleModeButton.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: nil)
        
    }
    
    private func setupWallpaper() {
        view.addSubview(wallpaperImageView)
        wallpaperImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        wallpaperImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        wallpaperImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        wallpaperImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        gradient.frame = view.frame
        view.layer.insertSublayer(gradient, at: 1)
    }
    
    private func setupLogo() {
        view.addSubview(logoImageView)
        logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: view.frame.width * scale).isActive = true
        logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 120 / 343).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setupPhotoButton() {
        view.addSubview(addPhotoButton)
        addPhotoButton.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 8).isActive = true
        addPhotoButton.widthAnchor.constraint(equalTo: logoImageView.heightAnchor, multiplier: 1).isActive = true
        addPhotoButton.heightAnchor.constraint(equalTo: logoImageView.heightAnchor, multiplier: 1).isActive = true
        addPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setupInputTextFields() {
        view.addSubview(fullNameTextField)
        fullNameTextField.topAnchor.constraint(equalTo: addPhotoButton.bottomAnchor, constant: 8).isActive = true
        fullNameTextField.widthAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 1).isActive = true
        fullNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        setupCredentialTextFields()
        
        fullNameTextField.heightAnchor.constraint(equalToConstant: emailTextField.frame.size.height).isActive = true
        fullNameTextField.layoutIfNeeded()
        fullNameTextField.setupTextField(leftImage: #imageLiteral(resourceName: "User Icon"), placeHolder: "Full Name", fontSize: fontSize)
    }
    
    private func setupOrLabel() {
        view.addSubview(orLabel)
        orLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8).isActive = true
        orLabel.widthAnchor.constraint(equalToConstant: fullNameTextField.frame.width).isActive = true
        orLabel.heightAnchor.constraint(equalToConstant: fullNameTextField.frame.height * 0.3).isActive = true
        orLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        orLabel.layoutIfNeeded()
        orLabel.font = UIFont.systemFont(ofSize: fontSize)
    }
    
    private func setupAuthButton() {
        view.addSubview(authenticateButton)
        authenticateButton.topAnchor.constraint(equalTo: facebookButton.bottomAnchor, constant: 24).isActive = true
        authenticateButton.widthAnchor.constraint(equalTo: logoImageView.widthAnchor).isActive = true
        authenticateButton.heightAnchor.constraint(equalTo: fullNameTextField.heightAnchor).isActive = true
        authenticateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setupCredentialTextFields() {
        credentialStackView.addArrangedSubview(emailTextField)
        credentialStackView.addArrangedSubview(passwordTextField)
        
        view.addSubview(credentialStackView)
        credentialStackView.translatesAutoresizingMaskIntoConstraints = false
        credentialStackView.topAnchor.constraint(equalTo: fullNameTextField.bottomAnchor, constant: 8).isActive = true
        credentialStackView.widthAnchor.constraint(equalTo: logoImageView.widthAnchor).isActive = true
        credentialStackView.heightAnchor.constraint(equalTo: logoImageView.heightAnchor).isActive = true
        credentialStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        credentialStackView.layoutIfNeeded()
        emailTextField.setupTextField(leftImage: #imageLiteral(resourceName: "Email Icon"), placeHolder: "Email", fontSize: fontSize)
        passwordTextField.setupTextField(leftImage: #imageLiteral(resourceName: "Lock Icon"), placeHolder: "Password", fontSize: fontSize)
    }
    
    private func setupSocialButtons() {
        let stackView = UIStackView(arrangedSubviews: [facebookButton, googleButton])
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 16
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 8).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.layoutIfNeeded()
        
        facebookButton.heightAnchor.constraint(equalToConstant: passwordTextField.frame.height).isActive = true
        facebookButton.widthAnchor.constraint(equalToConstant: passwordTextField.frame.height).isActive = true
        facebookButton.layoutIfNeeded()
        setupFacebookBtn()
        
        googleButton.heightAnchor.constraint(equalToConstant: passwordTextField.frame.height).isActive = true
        googleButton.widthAnchor.constraint(equalToConstant: passwordTextField.frame.height).isActive = true
        googleButton.layoutIfNeeded()
        setupGoogleBtn()
        
    }
    
    private func setupGoogleBtn() {
        self.googleButton.layer.cornerRadius = googleButton.frame.height / 2
        
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
    
    private func setupFacebookBtn() {
        self.facebookButton.layer.cornerRadius = facebookButton.frame.height / 2
        
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
    
    private func setupToggleModeButton() {
        
        view.addSubview(toggleModeButton)
        toggleModeButton.topAnchor.constraint(equalTo: authenticateButton.bottomAnchor, constant: 8).isActive = true
        toggleModeButton.widthAnchor.constraint(equalTo: logoImageView.widthAnchor).isActive = true
        toggleModeButton.heightAnchor.constraint(equalTo: orLabel.heightAnchor).isActive = true
        toggleModeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        toggleModeButton.layoutIfNeeded()
        
        self.signUpModePrompt = NSMutableAttributedString(string: "Don't have an account? ",
                                                          attributes: [
                                                            .foregroundColor: UIColor.white,
                                                            .font: UIFont.systemFont(ofSize: self.fontSize)])
        
        let attributedSignUp = NSMutableAttributedString(string: "Sign Up.",
                                                         attributes: [
                                                            .foregroundColor: color,
                                                            .font: UIFont.boldSystemFont(ofSize: self.fontSize)])
        
        
        self.signInModePrompt = NSMutableAttributedString(string: "Already have an account? ",
                                                          attributes: [
                                                            .foregroundColor: UIColor.white,
                                                            .font: UIFont.systemFont(ofSize: self.fontSize)])
        
        let attributedSignIn = NSMutableAttributedString(string: "Sign In.",
                                                         attributes: [
                                                            .foregroundColor: color,
                                                            .font: UIFont.boldSystemFont(ofSize: self.fontSize)])
        
        
        self.signUpModePrompt?.append(attributedSignUp)
        self.signInModePrompt?.append(attributedSignIn)
        
        self.toggleModeButton.setAttributedTitle(signUpModePrompt, for: .normal)
        toggleModeButton.layoutIfNeeded()
        
    }
    
    
}


// MARK: Mode Logic
extension LoginVC {
    
    private func theSpecial() {
        if specialCount > 20, !specialOn{
            wallpaperImageView.image = #imageLiteral(resourceName: "Bad Background")
            logoImageView.image = #imageLiteral(resourceName: "Bad Logo")
            changeTheme(newColor: #colorLiteral(red: 0, green: 0.2392156863, blue: 0.6470588235, alpha: 1))
            view.layoutSubviews()
            specialCount = 0
            specialOn = true
        }
        else if specialCount > 10, specialOn {
            wallpaperImageView.image = #imageLiteral(resourceName: "Wallpaper1")
            logoImageView.image = #imageLiteral(resourceName: "Logo")
            changeTheme(newColor: color)
            view.layoutSubviews()
            specialCount = 0
            specialOn = false
        }
        else {
            specialCount += 1
        }
    }
    
    private func changeTheme(newColor: UIColor) {
        addPhotoButton.layer.borderColor = newColor.cgColor
        addPhotoButton.tintColor = newColor
        fullNameTextField.tintColor = newColor
        emailTextField.tintColor = newColor
        passwordTextField.tintColor = newColor
        authenticateButton.backgroundColor = newColor
    }
    
    func changeText() {
        
        let gradientAnimation = CABasicAnimation(keyPath: "colors")
        gradientAnimation.duration = 0.5
        gradientAnimation.fillMode = kCAFillModeForwards
        gradientAnimation.isRemovedOnCompletion = false
        
        self.toggleModeButton.isEnabled = false
        self.authenticateButton.isEnabled = false
        
        
        if !isSignIn {
            
            self.authenticateButton.titleLabel?.adjustsFontSizeToFitWidth = true
            self.authenticateButton.setTitle("Sign Up", for: .normal)
            self.toggleModeButton.setAttributedTitle(self.signInModePrompt, for: .normal)
            
            gradientAnimation.toValue = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7).cgColor, #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor]
            
            gradient.add(gradientAnimation, forKey: "colorChange")
            
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                self.logoImageView.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
            
            UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                self.fullNameTextField.alpha = 1.0
                self.fullNameTextField.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
            
            UIView.animate(withDuration: 0.3, delay: 0.2, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                self.addPhotoButton.alpha = 1.0
                self.addPhotoButton.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: { (_) in
                self.toggleModeButton.isEnabled = true
                self.authenticateButton.isEnabled = true
                self.gradient.colors = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7).cgColor, #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor]
            })
            
        }
        else {
            self.authenticateButton.titleLabel?.adjustsFontSizeToFitWidth = true
            self.authenticateButton.setTitle("Sign In", for: .normal)
            self.toggleModeButton.setAttributedTitle(self.signUpModePrompt, for: .normal)
            
            gradientAnimation.toValue = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor, #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor]
            gradient.add(gradientAnimation, forKey: "colorChange")
            
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                self.addPhotoButton.alpha = 0.0
                self.addPhotoButton.transform = CGAffineTransform(translationX: self.view.frame.width, y: 0)
            }, completion: nil)
            
            UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                self.fullNameTextField.alpha = 0.0
                self.fullNameTextField.transform = CGAffineTransform(translationX: self.view.frame.width, y: 0)
            }, completion: nil)
            
            UIView.animate(withDuration: 0.3, delay: 0.2, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                self.logoImageView.transform = CGAffineTransform(translationX: 0, y: self.transformHeight)
            }, completion: { (_) in
                self.toggleModeButton.isEnabled = true
                self.authenticateButton.isEnabled = true
                self.gradient.colors = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor, #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor]
            })
        }
        
        theSpecial()
    }
    

}
