//
//  AppDelegate.swift
//  TMDemoApp
//
//  Created by Interaction on 6/13/20.
//  Copyright © 2020 TechMahindra. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let detailListViewController = DetailListViewController()
        detailListViewController.view.backgroundColor = .white
        let navigationController = UINavigationController(rootViewController: detailListViewController)
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        return true
    }

    // MARK: UISceneSession Lifecycle

   


}

