//
//  WebViewViewController.swift
//  ShopProjectHomeWork
//
//  Created by Григоренко Александр Игоревич on 13.10.2022.
//

import UIKit
import WebKit

typealias TapHandler = (() -> ())

/// Экран показа товара на сайте интернет магазина.
final class WebViewViewController: UIViewController {

    // MARK: - private visual components

    private var webShopWKWebView = WKWebView()
    private var serfBarView = SerfBarView()

    // MARK: - private properties

    private var goodsName: String?
    private var backButtonHandler: TapHandler?
    private var forwardButtonHandler: TapHandler?
    private var reloadButtonHandler: TapHandler?
    private var shareButtonHandler: TapHandler?

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureViews()
        loadWebShop()
        navigationController?.navigationBar.isHidden = true
    }

    // MARK: - Инициализатор

    init(goodsLabelText: String) {
        self.goodsName = goodsLabelText
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - private funcs

    private func configureViews() {
        addWebShopWKWebView()
        configureHandlers()
        addWebShopWKWebView()
        addSerfBarView()
    }

    private func configureHandlers() {
        backButtonHandler = { [weak self] in
            guard let self = self else { return }
            self.webShopWKWebView.goBack()
        }

        forwardButtonHandler = { [weak self] in
            guard let self = self else { return }
            self.webShopWKWebView.goForward()
        }

        reloadButtonHandler = { [weak self] in
            guard let self = self else { return }
            self.webShopWKWebView.reload()
        }

        shareButtonHandler = { [weak self] in
            guard let self = self else { return }
            let activityController = UIActivityViewController(
                activityItems: [ self.getLink(goodsLabelText: self.goodsName ?? "")],
                applicationActivities: nil
            )
            self.navigationController?.present(activityController, animated: false)
        }
    }

    private func addWebShopWKWebView() {
        webShopWKWebView = WKWebView(frame: CGRect(
            x: 0,
            y: 0,
            width: view.frame.width,
            height: view.frame.height * 0.85)
        )
        view.addSubview(webShopWKWebView)
    }

    private func loadWebShop() {
        guard let url = URL(string: getLink(goodsLabelText: goodsName ?? "")) else { return }
        let request = URLRequest(url: url)
        webShopWKWebView.load(request)
    }

    private func addSerfBarView() {
        serfBarView = SerfBarView(
            frame: CGRect(
                x: webShopWKWebView.frame.origin.x,
                y: webShopWKWebView.frame.origin.y + webShopWKWebView.frame.height,
                width: view.frame.width,
                height: view.frame.height * 0.15),
            backButtonHandler: backButtonHandler,
            forwardButtonHandler: forwardButtonHandler,
            reloadButtonHandler: reloadButtonHandler,
            shareButtonHandler: shareButtonHandler
        )
        view.addSubview(serfBarView)
    }

    private func getLink(goodsLabelText: String) -> String {
        var urlString = ""
        switch goodsLabelText {
        case Strings.caselabelText:
            urlString = Links.greyCaseLink
        case Strings.brownCaseLabelText:
            urlString = Links.brownCaseLink
        case Strings.clocklabelText:
            urlString = Links.clockBeltLink
        default:
            break
        }
        return urlString
    }
}
