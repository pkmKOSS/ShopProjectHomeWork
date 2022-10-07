//
//  ForYouScreenViewController.swift
//  ShopProjectHomeWork
//
//  Created by Григоренко Александр Игоревич on 07.10.2022.
//

import UIKit

/// Экран персональных предложений.
final class ForYouScreenViewController: UIViewController {

    // MARK: - private visual components

    private var someImage: UIImage

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        cinfigureImageView()
    }

    // MARK: - Инициализатор

    init(image: UIImage = UIImage()) {
        self.someImage = image
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - private funcs

    private func cinfigureImageView() {
        let imageView = UIImageView(image: someImage)
        imageView.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        view.addSubview(imageView)
    }
}
