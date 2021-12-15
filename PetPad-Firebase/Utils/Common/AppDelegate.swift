//
//  AppDelegate.swift
//  PetPad-Firebase
//
//  Created by Sendo Tjiam on 18/10/21.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    override init() {
        FirebaseApp.configure()
    }

}

