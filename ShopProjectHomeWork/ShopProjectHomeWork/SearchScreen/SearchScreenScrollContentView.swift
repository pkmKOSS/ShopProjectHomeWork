//
//  ScrollViewContentView.swift
//  ShopProjectHomeWork
//
//  Created by Григоренко Александр Игоревич on 09.10.2022.
//

import UIKit

/// Экран поиска товара.
final class SearchScreenScrollContentView: UIView {

    // MARK: - private visual components

    private var macbookView = GoodsView()
    private var clockView = GoodsView()
    private var brownCaseView = GoodsView()

    // MARK: - private properties

    private var tapActionHandler: ((_ handler: [UIImage?], String) -> Void)?

    // MARK: - Инициализатор

    init(frame: CGRect = CGRect(),
         action: ((_ handler: [UIImage?], String) -> Void)? = nil
    ) {
        self.tapActionHandler = action
        super.init(frame: frame)
        configureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - private funcs

    private func configureView() {
        addMacbookCaseView()
        addClockBeltView()
        addBrownCaseView()
    }

    private func addMacbookCaseView() {
        macbookView = GoodsView(
            frame: CGRect(
                x: frame.origin.x,
                y: 0,
                width: 150,
                height: 200
            ),
            images: [UIImage(named: "case1"),
                     UIImage(named: "case2"),
                     UIImage(named: "case3")],
            labelText: Strings.caselabelText,
            tapActionHandler: tapActionHandler
        )
        macbookView.backgroundColor = #colorLiteral(red: 0.109885104, green: 0.1097899005, blue: 0.1180514768, alpha: 1)
        macbookView.layer.cornerRadius = 10
        addSubview(macbookView)
    }

    private func addClockBeltView() {
        clockView = GoodsView(
            frame: CGRect(
                x: macbookView.frame.origin.x + macbookView.frame.width + 10,
                y: macbookView.frame.origin.y,
                width: 150,
                height: 200
            ),
            images: [UIImage(named: "clock1"),
                     UIImage(named: "clock2")],
            labelText: Strings.clocklabelText,
            tapActionHandler: tapActionHandler
        )
        clockView.backgroundColor = #colorLiteral(red: 0.109885104, green: 0.1097899005, blue: 0.1180514768, alpha: 1)
        clockView.layer.cornerRadius = 10
        addSubview(clockView)
    }

    private func addBrownCaseView() {
        brownCaseView = GoodsView(
            frame: CGRect(
                x: clockView.frame.origin.x + clockView.frame.width + 10,
                y: macbookView.frame.origin.y,
                width: 150,
                height: 200
            ),
            images: [UIImage(named: "caseBrown1"),
                     UIImage(named: "caseBrown2"),
                     UIImage(named: "caseBrown3")],
            labelText: Strings.brownCaseLabelText,
            tapActionHandler: tapActionHandler
        )
        brownCaseView.backgroundColor = #colorLiteral(red: 0.109885104, green: 0.1097899005, blue: 0.1180514768, alpha: 1)
        brownCaseView.layer.cornerRadius = 10
        addSubview(brownCaseView)
    }
}
