//
//  Service.swift
//  BAD Queue
//
//  Created by Derek Nguyen on 3/31/18.
//  Copyright © 2018 B Alpha Delta. All rights reserved.
//

import UIKit
import JGProgressHUD

class System {
    static var isSignInMode = true
    
    static var widthScale = CGFloat(0.85)
    static var fontSize = CGFloat(14.0)
    
    static var specialCount = 0
    static var specialOn = false
    
    static var logo = #imageLiteral(resourceName: "Logo").withRenderingMode(.alwaysOriginal)
    static var wallpaper = #imageLiteral(resourceName: "Wallpaper1").withRenderingMode(.alwaysOriginal)
    static var mainColor = #colorLiteral(red: 0.6218340993, green: 0, blue: 0, alpha: 1)
    static var secondaryColor = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 0.8)
    static var hiddenColor = #colorLiteral(red: 0, green: 0.2392156863, blue: 0.6470588235, alpha: 1)
    static var mainGradientColors = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor, #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor]
    static var secondaryGradientColors = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7).cgColor, #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor]
    static var borderRadius = 5
    
    
}

extension System {
    static func toggleMode() {
        isSignInMode = !isSignInMode
    }
    
    static func toggleSpecial() {
        specialOn = !specialOn
    }
    
    static func incrementSpecial() {
        specialCount += 1
    }
    
    static func iPhone4Mode() {
        widthScale = 0.7
        fontSize = 12.0
    }
    
    static func resetSpecialCount() {
        specialCount = 0
    }
    
}
