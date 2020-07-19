//
//  AppDelegate.swift
//  MetronomoIOS
//
//  Created by Arthur Luiz Lara Quites on 17/01/20.
//  Copyright © 2020 Arthur Luiz Lara Quites. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        guard let windowU = self.window else {
            return false
        }
        
        let navHome = CustomNavigationController()
        let home = HomeViewController()
        navHome.pushViewController(home, animated: true)
        navHome.title = "Home"

        let tabbar = CustomTabBarNavigation()
        tabbar.viewControllers = [navHome]

        windowU.rootViewController = tabbar
        windowU.makeKeyAndVisible()
        
        return true
    }
}

