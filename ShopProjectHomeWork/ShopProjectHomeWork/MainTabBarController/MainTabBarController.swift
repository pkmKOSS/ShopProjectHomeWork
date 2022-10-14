//
//  MainTabBarController.swift
//  ShopProjectHomeWork
//
//  Created by Григоренко Александр Игоревич on 08.10.2022.
//

import UIKit
/// Главный ТабБарКонтроллер.
final class MainTabBarController: UITabBarController {

    // MARK: - private properties

    private var storeMainScreenNavViewController = UINavigationController()
    private var buyScreenNavViewController = UINavigationController()
    private var forYouScreenNavViewController = UINavigationController()
    private var buscetScreenNavViewController = UINavigationController()

    // MARK: - life cycle

    init() {
        super.init(nibName: nil, bundle: nil)
        configureNavControllers()
        configureTaBarController()
        configureTabBarItems()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - private funcs

    private func configureNavControllers() {
        storeMainScreenNavViewController = UINavigationController(
            rootViewController: CommonSearchScreenViewController()
        )
        buyScreenNavViewController = UINavigationController(rootViewController: BuyScreenViewController())
        forYouScreenNavViewController = UINavigationController(rootViewController: ForYouScreenViewController())
        buscetScreenNavViewController = UINavigationController(rootViewController: BuscetScreenViewController())
    }

    private func configureTaBarController() {
        self.viewControllers = [
            buyScreenNavViewController,
            forYouScreenNavViewController,
            storeMainScreenNavViewController,
            buscetScreenNavViewController
        ]
        self.tabBar.backgroundColor = #colorLiteral(red: 0.07058823854, green: 0.07058823854, blue: 0.07058823854, alpha: 1)
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().barTintColor = .systemBlue
    }

    private func configureTabBarItems() {
        let item1 = UITabBarItem(title: Strings.itemFirstTitleName, image: UIImage(systemName: Strings.itemFirstImageName), tag: 0)
        let item2 = UITabBarItem(title: Strings.itemSecondTitleName, image: UIImage(systemName: Strings.itemSecondImageName), tag: 1)
        let item3 = UITabBarItem(title: Strings.itemBasketTitleName, image: UIImage(systemName: Strings.itemBasketImageName), tag: 3)
        let item4 = UITabBarItem(title: Strings.itemBuyTitleName, image: UIImage(named: Strings.itemBuyImageName), tag: 2)

        storeMainScreenNavViewController.tabBarItem = item1
        buyScreenNavViewController.tabBarItem = item2
        forYouScreenNavViewController.tabBarItem = item3
        buscetScreenNavViewController.tabBarItem = item4
    }
}
