//
//  SerfBarView.swift
//  ShopProjectHomeWork
//
//  Created by Григоренко Александр Игоревич on 13.10.2022.
//

import UIKit

/// Представление с кнопками для навигации в браузере.
final class SerfBarView: UIView {

    // MARK: private visual components

    private var backButton = UIButton()
    private var forwardButtom = UIButton()
    private var reloadButton = UIButton()
    private var shareButton = UIButton()

    // MARK: - private property

    private var backButtonHandler: TapHandler?
    private var forwardButtonHandler: TapHandler?
    private var reloadButtonHandler: TapHandler?
    private var shareButtonHandler: TapHandler?

    // MARK: - Инициализатор

    init(
        frame: CGRect = CGRect(),
        backButtonHandler: TapHandler? = nil,
        forwardButtonHandler: TapHandler? = nil,
        reloadButtonHandler: TapHandler? = nil,
        shareButtonHandler: TapHandler? = nil
    ) {
        self.backButtonHandler = backButtonHandler
        self.forwardButtonHandler = forwardButtonHandler
        self.reloadButtonHandler = reloadButtonHandler
        self.shareButtonHandler = shareButtonHandler
        super.init(frame: frame)
        configureViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - private funcs

    private func configureViews() {
        backgroundColor = .lightGray
        addBackButton()
        addForwardButton()
        addReloadButton()
        addShareButton()
    }

    private func addBackButton() {
        backButton = UIButton(frame: CGRect(
            x: 20,
            y: 20,
            width: 20,
            height: 20)
        )
        backButton.setImage(UIImage(systemName: Strings.backButtonImageName), for: .normal)
        backButton.tintColor = .darkGray
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        addSubview(backButton)
    }

    private func addForwardButton() {
        forwardButtom = UIButton(frame: CGRect(
            x: backButton.frame.origin.x + backButton.frame.width + 10,
            y: backButton.frame.origin.y,
            width: 20,
            height: 20)
        )
        forwardButtom.setImage(UIImage(systemName: Strings.forwardButtonImageName), for: .normal)
        forwardButtom.tintColor = .darkGray
        forwardButtom.addTarget(self, action: #selector(forwardButtonAction), for: .touchUpInside)

        addSubview(forwardButtom)
    }

    private func addReloadButton() {
        reloadButton = UIButton(frame: CGRect(
            x: forwardButtom.frame.origin.x + forwardButtom.frame.width + 290,
            y: backButton.frame.origin.y,
            width: 20,
            height: 20)
        )
        reloadButton.setImage(UIImage(systemName: Strings.reloadButtonImageName), for: .normal)
        reloadButton.tintColor = .darkGray
        reloadButton.addTarget(self, action: #selector(reloadButtonAction), for: .touchUpInside)
        addSubview(reloadButton)
    }

    private func addShareButton() {
        shareButton = UIButton(frame: CGRect(
            x: reloadButton.frame.origin.x + reloadButton.frame.width + 10,
            y: backButton.frame.origin.y,
            width: 20,
            height: 20)
        )
        shareButton.setImage(UIImage(systemName: Strings.shareNavBarItemImageName), for: .normal)
        shareButton.tintColor = .darkGray
        shareButton.addTarget(self, action: #selector(shareButtonAction), for: .touchUpInside)
        addSubview(shareButton)
    }

    // MARK: - @objc private funcs

    @objc private func backButtonAction() {
        guard let action = backButtonHandler else { return }
        action()
    }

    @objc private func forwardButtonAction() {
        guard let action = forwardButtonHandler else { return }
        action()
    }

    @objc private func reloadButtonAction() {
        guard let action = reloadButtonHandler else { return }
        action()
    }

    @objc private func shareButtonAction() {
        guard let action = shareButtonHandler else { return }
        action()
    }
}
