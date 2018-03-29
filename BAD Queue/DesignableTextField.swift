//
//  DesignableTextField.swift
//  BAD Queue
//
//  Created by Derek Nguyen on 3/27/18.
//  Copyright © 2018 B Alpha Delta. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableTextField: UITextField {

    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    fileprivate func updateView() {
        if let image = leftImage {
            leftViewMode = .always
            
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.image = image
            
            leftView = imageView
        }
        else {
            leftViewMode = .never
        }
    }

}
