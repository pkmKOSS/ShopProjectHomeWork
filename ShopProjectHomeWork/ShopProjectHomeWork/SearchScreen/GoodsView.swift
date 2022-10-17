//
//  ViewWithGoods.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 06.10.2022.
//

import UIKit

/// Представление с изображение и названием товара.
final class GoodsView: UIView {

    // MARK: - private visual components

    private var goodsImageView = UIImageView()
    private var goodsLabel = UILabel()
    private var images: [UIImage?] = []

    // MARK: - private properties

    private var tapActionHandler: SearchScreenTapAction?

    // MARK: - Инициализатор

    /// Инициализатор
    /// - Parameters:
    ///   - frame: Внешние границы представления.
    ///   - image: Изображения товара.
    ///   - labelText: Название товара.
    init(
        frame: CGRect = CGRect(
            x: 0,
            y: 0,
            width: 100,
            height: 100
        ),
        images: [UIImage?] = [],
        labelText: String = "Unkown",
        tapActionHandler: SearchScreenTapAction? = nil
    ) {
        self.images = images
        self.goodsLabel.text = labelText
        self.tapActionHandler = tapActionHandler
        super.init(frame: frame)
        addGoodsImageView()
        addGoodsLabel()
        addGestureRecognizerOnGoodsImageView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - private funcs

    private func addGoodsImageView() {
        goodsImageView.frame = CGRect(
            x: 25,
            y: 25,
            width: 100,
            height: 100)
        goodsImageView.image = images.first ?? UIImage()
        goodsImageView.contentMode = .scaleAspectFit
        addSubview(goodsImageView)
    }

    private func addGoodsLabel() {
        goodsLabel.frame = CGRect(
            x: goodsImageView.frame.origin.x - 10,
            y: goodsImageView.frame.origin.y + goodsImageView.frame.height - 10,
            width: goodsImageView.frame.width + 20,
            height: 80)
        goodsLabel.lineBreakMode = .byWordWrapping
        goodsLabel.numberOfLines = 0
        goodsLabel.textColor = .white
        goodsLabel.font = UIFont.boldSystemFont(ofSize: 13)
        addSubview(goodsLabel)
    }

    private func addGestureRecognizerOnGoodsImageView() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapOnImageAction))
        goodsImageView.addGestureRecognizer(gestureRecognizer)
        goodsImageView.isUserInteractionEnabled = true
    }

    // MARK: - @objc func

    @objc func tapOnImageAction() {
        guard let action = tapActionHandler else { return }
        action(images, goodsLabel.text ?? "")
    }
}
