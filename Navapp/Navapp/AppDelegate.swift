//
//  AppDelegate.swift
//  Navapp
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
        let f = FirstViewController()
        w.rootViewController = UINavigationController(rootViewController: f)
        w.makeKeyAndVisible()
        self.window = w
        
        return true
    }




}

