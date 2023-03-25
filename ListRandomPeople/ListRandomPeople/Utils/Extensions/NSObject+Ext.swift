//
//  NSObject+Ext.swift
//  ListRandomPeople
//
//  Created by Oguzhan Yalcin on 25.03.2023.
//

import Foundation

extension NSObject {
    
    class var className: String {
        return String(describing: self)
    }
}
