//
//  AppDelegate.swift
//  ListRandomPeople
//
//  Created by Oguzhan Yalcin on 25.03.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        openApp()
        
        return true
    }
    
    private func openApp() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootVC = ListPeopleRouter().returnVC()
        let navController = UINavigationController(rootViewController: rootVC)
        
        window.rootViewController = navController
        window.makeKeyAndVisible()
    }
}
