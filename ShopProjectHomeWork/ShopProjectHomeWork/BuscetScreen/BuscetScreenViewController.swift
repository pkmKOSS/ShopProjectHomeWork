//
//  BuscetScreenViewController.swift
//  ShopProjectHomeWork
//
//  Created by Григоренко Александр Игоревич on 07.10.2022.
//

import UIKit

/// Экран корзины.
final class BuscetScreenViewController: UIViewController {

    // MARK: - lyfe cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        cinfigureView()
    }

    // MARK: - private funcs

    private func cinfigureView() {
        tabBarController?.tabBar.tintColor = .blue
        view.backgroundColor = .red
    }
}
