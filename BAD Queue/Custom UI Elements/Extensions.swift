//
//  ConstraintExtension.swift
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
