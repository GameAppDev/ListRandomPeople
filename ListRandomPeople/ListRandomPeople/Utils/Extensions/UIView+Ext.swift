//
//  UIView+Ext.swift
//  ListRandomPeople
//
//  Created by Oguzhan Yalcin on 25.03.2023.
//

import UIKit

extension UIView {
    
    func roundCorners(size: CGFloat) {
        self.layer.cornerRadius = size
        self.clipsToBounds = true
    }
    
    func setBorder(width: CGFloat, color: UIColor) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
}
