//
//  AppDelegate.swift
//  HomeService
//
//  Created by Sergiy Kostrykin on 23.05.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        _ = AppRouter.shared
        return true
    }
}

