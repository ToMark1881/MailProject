//
//  AppDelegate.swift
//  MailProjectIPZ
//
//  Created by Vladyslav Vdovychenko on 5/8/19.
//  Copyright © 2019 Vladyslav Vdovychenko. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationController = UINavigationController(rootViewController: UserVC())
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        FirebaseApp.configure()
        // Override point for customization after application launch.
        return true
    }
}

