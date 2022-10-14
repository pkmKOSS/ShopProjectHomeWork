//
//  GoodsViewController.swift
//  ShopProjectHomeWork
//
//  Created by Григоренко Александр Игоревич on 09.10.2022.
//

import UIKit

/// Экран выбора характеристик товара.
final class GoodsViewController: UIViewController {

    // MARK: - private visual components

    private var goodsNameBigLabel = UILabel()
    private var goodsCostLabel = UILabel()
    private var goodsImageScrollView = UIScrollView()
    private var goodsNameSmallLabel = UILabel()
    private var goodsLigthGrayButton = UIButton()
    private var goodsDarkGrayButton = UIButton()
    private var goodsCompatibleLabel = UILabel()
    private var addInBusketButton = UIButton()
    private var infoAboutDeliveryHeadLabel = UILabel()
    private var infoAboutDeliveryLabel = UILabel()
    private var variablesOfDeliveryLabel = UILabel()
    private var boxImageView = UIImageView()
    private var greenOkImageView = UIImageView()

    // MARK: - private properties

    private var images: [UIImage?] = []

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }

    // MARK: - Инициализатор

    init(images: [UIImage?]) {
        self.images = images
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - private funcs

    private func configureViews() {
        addGoodsNameBigLabel()
        addGoodsCostLabel()
        addGoodsImageScrollView()
        addGoodsNameSmallLabel()
        addGoodsLigthGrayButton()
        addGoodsDarkGrayButton()
        addGreenOkImageView()
        addGoodsCompatibleLabel()
        addBusketButton()
        addBoxImageView()
        addInfoAboutDeliveryHeadLabel()
        addInfoAboutDeliveryLabel()
        addVariablesOfDeliveryLabel()
        configureNavBar()
    }

    // MARK: - private funcs

    private func configureNavBar() {
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.08506701142, green: 0.07055453211, blue: 0.08686403185, alpha: 1)
        navigationController?.navigationBar.backItem?.title = Strings.navigationBarBackItemTitle

        let shareItem = UIBarButtonItem(
            image: UIImage(systemName: Strings.shareNavBarItemImageName),
            style: .done,
            target: nil,
            action: nil)
        shareItem.tintColor = .systemBlue

        let likeItem = UIBarButtonItem(
            image: UIImage(systemName: Strings.likeNavBarItemImageName),
            style: .done,
            target: nil,
            action: nil)

        navigationItem.rightBarButtonItems = [shareItem, likeItem]
    }

    private func addGoodsNameBigLabel() {
        goodsNameBigLabel = UILabel(frame: CGRect(
            x: 0,
            y: 100,
            width: view.frame.width - 20,
            height: 20))
        goodsNameBigLabel.center.x = view.center.x
        goodsNameBigLabel.text = Strings.goodsNameBigLabelText
        goodsNameBigLabel.font = UIFont.boldSystemFont(ofSize: 15)
        goodsNameBigLabel.textColor = .white
        goodsNameBigLabel.textAlignment = .center
        view.addSubview(goodsNameBigLabel)
    }

    private func addGoodsCostLabel() {
        goodsCostLabel = UILabel(frame: CGRect(
            x: 0,
            y: goodsNameBigLabel.frame.origin.y + goodsNameBigLabel.frame.height + 5,
            width: view.frame.width - 20,
            height: 20))
        goodsCostLabel.center.x = goodsNameBigLabel.center.x
        goodsCostLabel.text = Strings.goodsCostLabelText
        goodsCostLabel.font = UIFont.systemFont(ofSize: 15)
        goodsCostLabel.textColor = #colorLiteral(red: 0.579756263, green: 0.5644315212, blue: 0.6064749053, alpha: 1)
        goodsCostLabel.textAlignment = .center
        view.addSubview(goodsCostLabel)
    }

    private func addGoodsImageScrollView() {
        goodsImageScrollView = UIScrollView(frame: CGRect(
            x: 0,
            y: goodsCostLabel.frame.origin.y + goodsCostLabel.frame.height + 20,
            width: view.bounds.size.width,
            height: 200))
        goodsImageScrollView.contentSize = CGSize(width: view.bounds.size.width * 3, height: 200)
        goodsImageScrollView.backgroundColor = .black
        goodsImageScrollView.isPagingEnabled = true
        goodsImageScrollView.indicatorStyle = .white
        view.addSubview(goodsImageScrollView)
        addImageInScrollView()
    }

    private func addImageInScrollView() {
        var rect = goodsImageScrollView.bounds
        for image in images {
            let newImage = UIImageView(image: image ?? UIImage())
            newImage.frame = rect
            newImage.bounds.size.height -= 50
            newImage.contentMode = .scaleAspectFit
            goodsImageScrollView.addSubview(newImage)
            rect.origin.x += rect.size.width
        }
    }

    private func addGoodsNameSmallLabel() {
        goodsNameSmallLabel = UILabel(frame: CGRect(
            x: 0,
            y: goodsImageScrollView.frame.origin.y + goodsImageScrollView.frame.height + 10,
            width: view.frame.width - 20,
            height: 20))
        goodsNameSmallLabel.center.x = view.center.x
        goodsNameSmallLabel.text = Strings.goodsNameBigLabelText
        goodsNameSmallLabel.font = UIFont.systemFont(ofSize: 10)
        goodsNameSmallLabel.textColor = #colorLiteral(red: 0.579756263, green: 0.5644315212, blue: 0.6064749053, alpha: 1)
        goodsNameSmallLabel.textAlignment = .center
        view.addSubview(goodsNameSmallLabel)
    }

    private func addGoodsLigthGrayButton() {
        goodsLigthGrayButton = UIButton(frame: CGRect(
            x: view.center.x - 40,
            y: goodsNameSmallLabel.frame.origin.y + goodsNameSmallLabel.frame.height + 40,
            width: 35,
            height: 35))
        goodsLigthGrayButton.clipsToBounds = true
        goodsLigthGrayButton.layer.cornerRadius = 0.5 * goodsLigthGrayButton.bounds.size.width
        goodsLigthGrayButton.backgroundColor = .lightGray
        view.addSubview(goodsLigthGrayButton)
    }

    private func addGoodsDarkGrayButton() {
        goodsDarkGrayButton = UIButton(frame: CGRect(
            x: view.center.x + 5,
            y: goodsNameSmallLabel.frame.origin.y + goodsNameSmallLabel.frame.height + 40,
            width: 35,
            height: 35))
        goodsDarkGrayButton.clipsToBounds = true
        goodsDarkGrayButton.layer.cornerRadius = 0.5 * goodsDarkGrayButton.bounds.size.width
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = goodsDarkGrayButton.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.194206357, green: 0.1725068986, blue: 0.1928621531, alpha: 1).cgColor, #colorLiteral(red: 0.3491136748, green: 0.3297520554, blue: 0.34427327, alpha: 1).cgColor]

        goodsDarkGrayButton.layer.shadowColor = UIColor.yellow.cgColor
        goodsDarkGrayButton.layer.shadowOpacity = 1
        goodsDarkGrayButton.layer.shadowOffset = .zero
        goodsDarkGrayButton.layer.shadowRadius = 10

        goodsDarkGrayButton.layer.insertSublayer(gradientLayer, at: 0)
        view.addSubview(goodsDarkGrayButton)
    }

    private func addGreenOkImageView() {
        greenOkImageView = UIImageView(frame: CGRect(
            x: 90,
            y: goodsDarkGrayButton.frame.origin.y + goodsDarkGrayButton.frame.height + 30,
            width: 25,
            height: 25))
        greenOkImageView.image = UIImage(systemName: Strings.greenOkButtonImageName)
        greenOkImageView.clipsToBounds = true
        greenOkImageView.layer.cornerRadius = 12
        greenOkImageView.layer.borderWidth = 5
        greenOkImageView.layer.borderColor = UIColor.black.cgColor
        greenOkImageView.backgroundColor = #colorLiteral(red: 0.2592384219, green: 0.824129045, blue: 0.3576895595, alpha: 1)
        greenOkImageView.tintColor = .black
        view.addSubview(greenOkImageView)
    }

    private func addGoodsCompatibleLabel() {
        goodsCompatibleLabel = UILabel(frame: CGRect(
            x: greenOkImageView.frame.origin.x + greenOkImageView.frame.width + 10,
            y: goodsDarkGrayButton.frame.origin.y + goodsDarkGrayButton.frame.height + 32,
            width: view.frame.width - 20,
            height: 20))
        let string = Strings.goodsCompatibleLabelText
        let rangeOne = (string as NSString).range(of: Strings.comparabaleLabelFirstString)
        let rangeTwo = (string as NSString).range(of: Strings.comparabaleLabelSecondString)
        let attributedString = NSMutableAttributedString(string: string)

        attributedString.addAttribute(.foregroundColor, value: #colorLiteral(
            red: 0.579756263,
            green: 0.5644315212,
            blue: 0.6064749053,
            alpha: 1),
            range: rangeOne)

        attributedString.addAttribute(.foregroundColor, value: UIColor.link, range: rangeTwo)

        goodsCompatibleLabel.attributedText = attributedString
        goodsCompatibleLabel.font = UIFont.systemFont(ofSize: 10)
        goodsCompatibleLabel.textAlignment = .left
        view.addSubview(goodsCompatibleLabel)
    }

    private func addBusketButton() {
        addInBusketButton = UIButton(frame: CGRect(
            x: 25,
            y: goodsCompatibleLabel.frame.origin.y + goodsCompatibleLabel.frame.height + 40,
            width: 370,
            height: 40))
        addInBusketButton.center.x = view.center.x
        addInBusketButton.backgroundColor = .systemBlue
        addInBusketButton.clipsToBounds = true
        addInBusketButton.layer.cornerRadius = 5
        addInBusketButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        addInBusketButton.setTitle(Strings.addInBusketButtonTitleText, for: .normal)
        view.addSubview(addInBusketButton)
    }

    private func addBoxImageView() {
        boxImageView = UIImageView(frame: CGRect(
            x: 25,
            y: addInBusketButton.frame.origin.y + addInBusketButton.frame.height + 40,
            width: 15,
            height: 15))
        boxImageView.image = UIImage(systemName: Strings.boxImageViewName)
        boxImageView.tintColor = .lightGray
        view.addSubview(boxImageView)
    }

    private func addInfoAboutDeliveryHeadLabel() {
        infoAboutDeliveryHeadLabel = UILabel(frame: CGRect(
            x: boxImageView.frame.origin.x + boxImageView.frame.width + 20,
            y: boxImageView.frame.origin.y - 5,
            width: view.frame.width - 20,
            height: 20))
        infoAboutDeliveryHeadLabel.text = Strings.infoAboutDeliveryHeadLabelText
        infoAboutDeliveryHeadLabel.textColor = .white
        infoAboutDeliveryHeadLabel.textAlignment = .left
        infoAboutDeliveryHeadLabel.font = UIFont.boldSystemFont(ofSize: 10)
        view.addSubview(infoAboutDeliveryHeadLabel)
    }

    private func addInfoAboutDeliveryLabel() {
        infoAboutDeliveryLabel = UILabel(frame: CGRect(
            x: infoAboutDeliveryHeadLabel.frame.origin.x,
            y: infoAboutDeliveryHeadLabel.frame.origin.y + infoAboutDeliveryHeadLabel.frame.height - 5,
            width: view.frame.width - 20,
            height: 20))
        infoAboutDeliveryLabel.text = Strings.infoAboutDeliveryLabelText
        infoAboutDeliveryLabel.textColor = .lightGray
        infoAboutDeliveryLabel.textAlignment = .left
        infoAboutDeliveryLabel.font = UIFont.systemFont(ofSize: 10)
        view.addSubview(infoAboutDeliveryLabel)
    }

    private func addVariablesOfDeliveryLabel() {
        variablesOfDeliveryLabel = UILabel(frame: CGRect(
            x: infoAboutDeliveryHeadLabel.frame.origin.x,
            y: infoAboutDeliveryLabel.frame.origin.y + infoAboutDeliveryLabel.frame.height - 5,
            width: view.frame.width - 20,
            height: 20))
        variablesOfDeliveryLabel.text = Strings.variablesOfDeliveryLabelText
        variablesOfDeliveryLabel.textColor = .link
        variablesOfDeliveryLabel.textAlignment = .left
        variablesOfDeliveryLabel.font = UIFont.systemFont(ofSize: 10)
        view.addSubview(variablesOfDeliveryLabel)
    }
}
