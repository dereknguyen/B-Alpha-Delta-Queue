//
//  Extensions.swift
//  BAD Queue
//
//  Created by Derek Nguyen on 3/29/18.
//  Copyright © 2018 B Alpha Delta. All rights reserved.
//

import UIKit

extension UITextField {
    func setupTextField(leftImage: UIImage? = nil, placeHolder: String? = "", fontSize: CGFloat) {
        
        self.layer.cornerRadius = 5
        
        if let text = placeHolder {
            let attributedText = NSAttributedString(string: text,
                                                    attributes: [
                                                        .foregroundColor: UIColor.gray,
                                                        .font: UIFont.systemFont(ofSize: fontSize)])
            self.attributedPlaceholder = attributedText
        }
        
        if let image = leftImage {
            leftViewMode = .always
            
            let viewHeight = self.frame.height * 0.5
            let viewWidth = self.frame.height * 0.6
            
            let imageView = UIImageView(frame: CGRect(x: viewHeight / 2, y: 0, width: viewWidth, height: viewHeight))
            imageView.image = image
            imageView.contentMode = .scaleAspectFit
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: viewWidth + viewHeight, height: viewHeight))
            view.addSubview(imageView)
            
            leftView = view
        }
        else {
            leftViewMode = .never
        }
    }
}

extension String {
    var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"
        let emailTest  = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}

