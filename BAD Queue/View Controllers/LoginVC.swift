//
//  LoginVC.swift
//  BAD Queue
//
//  Created by Derek Nguyen on 3/26/18.
//  Copyright © 2018 B Alpha Delta. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor, #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor]
        gradientLayer.frame = self.view.frame
        self.view.layer.insertSublayer(gradientLayer, at: 1)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

