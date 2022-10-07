//
//  MainTabBarController.swift
//  ShopProjectHomeWork
//
//  Created by Григоренко Александр Игоревич on 08.10.2022.
//

import UIKit
/// Главный ТабБарКонтроллер.
final class MainTabBarController: UITabBarController {

    var storeMainScreenNavViewController = UINavigationController()
    var buyScreenNavViewController = UINavigationController()
    var forYouScreenNavViewController = UINavigationController()
    var buscetScreenNavViewController = UINavigationController()

    init() {
        super.init(nibName: nil, bundle: nil)
        configureNavControllers()
        configureTaBarController()
        configureTabBarItems()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureNavControllers() {
        storeMainScreenNavViewController = UINavigationController(rootViewController: StoreMainScreenViewController())
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
        let item1 = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        let item2 = UITabBarItem(title: "Для Вас", image: UIImage(systemName: "person.crop.circle.fill"), tag: 1)
        let item3 = UITabBarItem(title: "Купить", image: UIImage(named: "laptop"), tag: 2)
        let item4 = UITabBarItem(title: "Корзина", image: UIImage(systemName: "case"), tag: 3)

        storeMainScreenNavViewController.tabBarItem = item1
        buyScreenNavViewController.tabBarItem = item2
        forYouScreenNavViewController.tabBarItem = item3
        buscetScreenNavViewController.tabBarItem = item4
    }
}
