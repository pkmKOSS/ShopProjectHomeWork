//
//  OrderStatusView.swift
//  ShopProjectHomeWork
//
//  Created by Григоренко Александр Игоревич on 14.10.2022.
//

import UIKit

/// Представление с информацией о текущем статусе заказа.
final class OrderStatusView: UIView {

    // MARK: - private visual components

    private var goodsImageView = UIImageView()
    private var orderStatusLabel = UILabel()
    private var goodsInfoLabel = UILabel()
    private var forwardButtonButton = UIButton()
    private var grayLineView = UIView()
    private var deliveryProgressView = UIProgressView()
    private var proccesedLabel = UILabel()
    private var sendedLabel = UILabel()
    private var deliveredLabel = UILabel()

    // MARK: - Инициализатор

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - private funcs

    private func configureViews() {
        addGoodsImageView()
        addOrderStatusLabel()
        addGoodsInfoLabel()
        addForwardButtonImageView()
        addGreyLineView()
        addDeliveryProgressView()
        addProccesedLabel()
        addSendedLabel()
        addDeliveredLabel()
    }

    private func addGoodsImageView() {
        goodsImageView.frame = CGRect(
            x: 15,
            y: 15,
            width: 50,
            height: 50)
        goodsImageView.image = UIImage(named: Strings.goodsImageViewIamgeName)
        goodsImageView.backgroundColor = .gray
        goodsImageView.contentMode = .scaleAspectFit
        addSubview(goodsImageView)
    }

    private func addOrderStatusLabel() {
        orderStatusLabel = UILabel(frame: CGRect(
            x: goodsImageView.frame.origin.x + goodsImageView.frame.width + 30,
            y: goodsImageView.frame.origin.y - 5,
            width: 200,
            height: 20))
        orderStatusLabel.text = Strings.orderStatusLabelText
        orderStatusLabel.lineBreakMode = .byWordWrapping
        orderStatusLabel.numberOfLines = 0
        orderStatusLabel.font = UIFont.boldSystemFont(ofSize: 15)
        orderStatusLabel.textColor = .black
        orderStatusLabel.textAlignment = .left
        addSubview(orderStatusLabel)
    }

    private func addGoodsInfoLabel() {
        goodsInfoLabel = UILabel(frame: CGRect(
            x: orderStatusLabel.frame.origin.x,
            y: orderStatusLabel.frame.origin.y + orderStatusLabel.frame.height,
            width: 200,
            height: 20))
        goodsInfoLabel.text = Strings.goodsInfoLabelText
        goodsInfoLabel.lineBreakMode = .byWordWrapping
        goodsInfoLabel.numberOfLines = 0
        goodsInfoLabel.font = UIFont.boldSystemFont(ofSize: 15)
        goodsInfoLabel.textColor = .lightGray
        goodsInfoLabel.textAlignment = .left
        addSubview(goodsInfoLabel)
    }

    private func addForwardButtonImageView() {
        forwardButtonButton = UIButton(frame: CGRect(
            x: orderStatusLabel.frame.origin.x + orderStatusLabel.frame.width + 30,
            y: orderStatusLabel.frame.origin.y + orderStatusLabel.frame.height - 10,
            width: 30,
            height: 30))
        forwardButtonButton.setImage(UIImage(systemName: Strings.forwardButtonImageName), for: .normal)
        forwardButtonButton.tintColor = .lightGray
        addSubview(forwardButtonButton)
    }

    private func addGreyLineView() {
        grayLineView.frame = CGRect(
            x: 0,
            y: goodsImageView.frame.origin.y + goodsImageView.frame.height + 10,
            width: frame.width,
            height: 0.5)
        grayLineView.backgroundColor = .lightGray
        addSubview(grayLineView)
    }

    private func addDeliveryProgressView() {
        deliveryProgressView.frame = CGRect(
            x: grayLineView.frame.origin.x,
            y: grayLineView.frame.origin.y + grayLineView.frame.height + 20,
            width: frame.width - 20,
            height: 10)
        deliveryProgressView.trackTintColor = .lightGray
        deliveryProgressView.center.x = grayLineView.center.x
        deliveryProgressView.trackTintColor = .systemGreen
        addSubview(deliveryProgressView)
    }

    private func addProccesedLabel() {
        proccesedLabel = UILabel(frame: CGRect(
            x: deliveryProgressView.frame.origin.x,
            y: deliveryProgressView.frame.origin.y + deliveryProgressView.frame.height + 5,
            width: 100,
            height: 20))
        proccesedLabel.text = Strings.proccesedLabelText
        proccesedLabel.lineBreakMode = .byWordWrapping
        proccesedLabel.numberOfLines = 0
        proccesedLabel.font = UIFont.boldSystemFont(ofSize: 10)
        proccesedLabel.textColor = .black
        proccesedLabel.textAlignment = .left
        addSubview(proccesedLabel)
    }

    private func addSendedLabel() {
        sendedLabel = UILabel(frame: CGRect(
            x: 0,
            y: proccesedLabel.frame.origin.y,
            width: 100,
            height: 20))
        sendedLabel.center.x = deliveryProgressView.center.x
        sendedLabel.text = Strings.sendedLabelText
        sendedLabel.lineBreakMode = .byWordWrapping
        sendedLabel.numberOfLines = 0
        sendedLabel.textAlignment = .center
        sendedLabel.font = UIFont.boldSystemFont(ofSize: 10)
        sendedLabel.textColor = .black
        addSubview(sendedLabel)
    }

    private func addDeliveredLabel() {
        deliveredLabel = UILabel(frame: CGRect(
            x: deliveryProgressView.frame.width - 52,
            y: proccesedLabel.frame.origin.y,
            width: 100,
            height: 20))
        deliveredLabel.text = Strings.deliveredLabelText
        deliveredLabel.lineBreakMode = .byWordWrapping
        deliveredLabel.numberOfLines = 0
        deliveredLabel.font = UIFont.boldSystemFont(ofSize: 10)
        deliveredLabel.textColor = .black
        deliveredLabel.textAlignment = .left
        addSubview(deliveredLabel)
    }
}
