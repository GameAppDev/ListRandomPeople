//
//  Array+Ext.swift
//  ListRandomPeople
//
//  Created by Oguzhan Yalcin on 25.03.2023.
//

import Foundation

extension Array {
    
    subscript (safe index: Index) -> Element? {
        return 0 <= index && index < count ? self[index] : nil
    }
    
    var isNotEmpty: Bool {
        return !isEmpty
    }
}
