//
//  AppDelegate.swift
//  MyFirstApp
//
//  Created by Etudiant on 03/05/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        //Creer fenetre puis mettre le controller dedans
        let w = UIWindow(frame: UIScreen.main.bounds)
        let home = HomeViewController() // chargement automatique du fichier HomeViewController.xib car même nom
        w.rootViewController = home // intégration de la home en tant que controller principal de l'application
        w.makeKeyAndVisible()
        self.window = w // mémorisation de la fenetre pour eviter de la detruite à la fin de la fonction
        
        return true
    }


    
    
}

