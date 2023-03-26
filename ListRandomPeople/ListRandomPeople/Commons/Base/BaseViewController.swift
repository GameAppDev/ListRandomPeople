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
    }
    
    private func setupViewController() {
        self.view.backgroundColor = UIColor.viewBGColour
    }
    
    public func setNavigationBarItems(title: String) {
        let textAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.navbarTextColour,
            NSAttributedString.Key.font: UIFont.navbarTextFont
        ]
        
        self.navigationItem.title = title
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
    }
}
