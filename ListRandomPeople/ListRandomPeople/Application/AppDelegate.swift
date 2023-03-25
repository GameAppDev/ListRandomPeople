//
//  AppDelegate.swift
//  ListRandomPeople
//
//  Created by Oguzhan Yalcin on 25.03.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        openApp()
        
        return true
    }
    
    private func openApp() {
        let rootVC = ListPeopleRouter().returnVC()
        let navController = UINavigationController(rootViewController: rootVC)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}
