//
//  AppDelegate.swift
//  Canada
//
//  Created by ShrawanKumar Sharma on 05/07/20.
//  Copyright © 2020 Shrawan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: AboutViewController())
      window?.makeKeyAndVisible()

        return true
    }
}

