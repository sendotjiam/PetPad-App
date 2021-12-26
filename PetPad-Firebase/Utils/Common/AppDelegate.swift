//
//  AppDelegate.swift
//  PetPad-Firebase
//
//  Created by Sendo Tjiam on 18/10/21.
//

import UIKit
import Firebase
import FirebaseAuth

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window : UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var navigationController = UINavigationController()
        //        navigationController.isNavigationBarHidden = true
        if Auth.auth().currentUser == nil {
            let loginViewController: LoginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            navigationController = UINavigationController(rootViewController: loginViewController)
            window?.rootViewController = navigationController
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let homeViewController: HomeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            navigationController = UINavigationController(rootViewController: homeViewController)
            //It removes all view controllers from the navigation controller then sets the new root view controller and it pops.
            window?.rootViewController = navigationController
        }
        return true
    }
    
    override init() {
        FirebaseApp.configure()
    }
    
}

