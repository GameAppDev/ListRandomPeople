//
//  Fonts.swift
//  ListRandomPeople
//
//  Created by Oguzhan Yalcin on 25.03.2023.
//

import UIKit

extension UIFont {
    
    static let navbarTextFont  = UIFont(name: AppFonts.bold.fontName, size: CGFloat(24).ws)
    static let textFont        = UIFont(name: AppFonts.medium.fontName, size: CGFloat(16).ws)
    static let titleFont       = UIFont(name: AppFonts.bold.fontName, size: CGFloat(18).ws)
}

enum AppFonts {
    case bold
    case medium
    
    var fontName: String {
        switch self {
        case .bold: return "Nunito-Bold"
        case .medium: return "Nunito-Medium"
        }
    }
}
