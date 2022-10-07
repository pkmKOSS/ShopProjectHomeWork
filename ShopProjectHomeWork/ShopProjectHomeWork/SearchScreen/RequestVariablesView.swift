//
//  ViewWithGoods.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 06.10.2022.
//

import UIKit

/// Представление с изображение и названием товара.
final class RequestVariablesView: UIView {

    // MARK: - private visual components
    private var searchImageView = UIImageView()
    private var searchVariablLabel = UILabel()
    private var grayLineView = UIView()

    /// Инициализатор
    /// - Parameters:
    ///   - frame: Внешние границы представления.
    ///   - image: Изображения товара.
    ///   - labelText: Название товара.
    init(
        frame: CGRect = CGRect(x: 0,
                               y: 0,
                               width: 100,
                               height: 100),
        image: UIImage = UIImage(),
        labelText: String = "Unkown"
    ) {
        super.init(frame: frame)
        self.searchImageView.image = image
        self.searchVariablLabel.text = labelText
        addGoodsImageView()
        addGoodsLabel()
        addGrayLineView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - private funcs

    private func addGoodsImageView() {
        searchImageView.frame = CGRect(
            x: 5,
            y: 5,
            width: 15,
            height: 15)
        searchImageView.contentMode = .redraw
        searchImageView.tintColor = #colorLiteral(red: 0.650980413, green: 0.650980413, blue: 0.650980413, alpha: 1)
        addSubview(searchImageView)
    }

    private func addGoodsLabel() {
        searchVariablLabel.frame = CGRect(
            x: searchImageView.frame.origin.x + searchImageView.frame.width + 10,
            y: searchImageView.frame.origin.y,
            width: 400,
            height: 30)
        searchVariablLabel.textColor = .white
        searchVariablLabel.center.y = searchImageView.center.y
        searchVariablLabel.font = UIFont.boldSystemFont(ofSize: 20)
        searchVariablLabel.textColor = #colorLiteral(red: 0.650980413, green: 0.650980413, blue: 0.650980413, alpha: 1)
        addSubview(searchVariablLabel)
    }

    private func addGrayLineView() {
        grayLineView.frame = CGRect(
            x: searchImageView.frame.origin.x,
            y: searchImageView.frame.origin.x + searchImageView.frame.height + 15,
            width: 400,
            height: 1)
        grayLineView.backgroundColor = #colorLiteral(red: 0.1841939654, green: 0.1841939654, blue: 0.1841939654, alpha: 1)
        addSubview(grayLineView)
    }
}
