//
//  AppDelegate.swift
//  ShopProjectHomeWork
//
//  Created by Григоренко Александр Игоревич on 07.10.2022.
//

import UIKit

@main
// Сгенерированый AppDelegate
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private var tabBar = UITabBarController()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let tabBarController = OnboardingPageViewController()
        self.window?.rootViewController = tabBarController

        window?.makeKeyAndVisible()
        return true
    }
}
