//
//  AppDelegate.swift
//  FirstForm
//
//  Created by Etudiant on 03/05/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let w = UIWindow(frame: UIScreen.main.bounds)
        w.rootViewController = UINavigationController(rootViewController: SubscribeViewController())
        w.makeKeyAndVisible()
        self.window = w
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

   


}

