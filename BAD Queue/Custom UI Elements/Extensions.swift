//
//  Extensions.swift
//  BAD Queue
//
//  Created by Derek Nguyen on 3/29/18.
//  Copyright © 2018 B Alpha Delta. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    /**
     Change multiplier constraint
     
     - parameter multiplier: CGFloat
     - returns: NSLayoutConstraint
     */
    func setMultiplier(multiplier:CGFloat) {
        
        NSLayoutConstraint.deactivate([self])
        
        guard let item = firstItem else { return }
        
        let newConstraint = NSLayoutConstraint(
            item: item,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
    }
}

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

