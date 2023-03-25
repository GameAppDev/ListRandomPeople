//
//  BaseViewController.swift
//  ListRandomPeople
//
//  Created by Oguzhan Yalcin on 25.03.2023.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewController()
        hideKeyboardWhenCicked()
    }
    
    fileprivate func setupViewController() {
        self.view.backgroundColor = UIColor.viewBGColour
    }
    
    public func setNavigationBarItems(title: String) {
        self.navigationItem.title = title
        
        let textAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.navbarTextColour,
            NSAttributedString.Key.font: UIFont.navbarTextFont
        ]
        
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
    }
}
