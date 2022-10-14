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

    private var forYouLabel = UILabel()
    private var avatarImageView = UIImageView()
    private var topGreyLineView = UIView()
    private var whatNewLabel = UILabel()
    private var orderStatusView = UIView()
    private var recomentForYouLabel = UILabel()
    private var notificationImageView = UIImageView()
    private var getNewsLabel = UILabel()
    private var activateNotificationLabel = UILabel()
    private var notificationButton = UIButton()
    private var bottomGreyLineView = UIView()
    private var yourDevicesLabel = UILabel()
    private var showAllDevicesLabel = UILabel()
    private var avatarImagePickerController = UIImagePickerController()

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureViews()
    }

    // MARK: - Инициализатор

    init(image: UIImage = UIImage()) {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - private funcs

    private func configureViews() {
        addForYouLabel()
        addAvatarImageView()
        addGreyLineView()
        addWhatNewLabel()
        addOrderView()
        addRecomendForYouLabel()
        addNotificationImageView()
        addGetNewsLabel()
        addNotificationButton()
        addActivateNotificationLabel()
        addBottomGreyLineView()
        addYourDevicesLabel()
        addShowAllDevicesLabel()
        addGestoreRecognizer()

        avatarImagePickerController.delegate = self
    }

    private func addForYouLabel() {
        forYouLabel = UILabel(frame: CGRect(
            x: 25,
            y: 150,
            width: 200,
            height: 35))
        forYouLabel.text = "Для вас"
        forYouLabel.font = UIFont.boldSystemFont(ofSize: 35)
        forYouLabel.textColor = .black
        forYouLabel.textAlignment = .left
        view.addSubview(forYouLabel)
    }

    private func addAvatarImageView() {
        avatarImageView.frame = CGRect(
            x: forYouLabel.frame.origin.x + forYouLabel.frame.width + 130,
            y: 0,
            width: 40,
            height: 40)
        avatarImageView.image = UIImage()
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width/2
        avatarImageView.backgroundColor = .gray
        avatarImageView.center.y = forYouLabel.center.y
        avatarImageView.contentMode = .scaleAspectFit
        view.addSubview(avatarImageView)
    }

    private func addGreyLineView() {
        topGreyLineView.frame = CGRect(
            x: forYouLabel.frame.origin.x,
            y: forYouLabel.frame.origin.y + forYouLabel.frame.height + 10,
            width: view.frame.width - 30,
            height: 1)
        topGreyLineView.backgroundColor = .lightGray
        view.addSubview(topGreyLineView)
    }

    private func addWhatNewLabel() {
        whatNewLabel = UILabel(frame: CGRect(
            x: forYouLabel.frame.origin.x,
            y: topGreyLineView.frame.origin.y + topGreyLineView.frame.height + 30,
            width: view.frame.width - 20,
            height: 30))
        whatNewLabel.text = "Вот что нового"
        whatNewLabel.font = UIFont.boldSystemFont(ofSize: 35)
        whatNewLabel.textColor = .black
        whatNewLabel.textAlignment = .left
        view.addSubview(whatNewLabel)
    }

   private func addOrderView() {
       orderStatusView = OrderStatusView(
           frame: CGRect(
               x: forYouLabel.frame.origin.x,
               y: whatNewLabel.frame.origin.y + whatNewLabel.frame.height + 40,
               width: view.frame.width - 50,
               height: 130
           )
       )
       orderStatusView.layer.cornerRadius = 5
       orderStatusView.backgroundColor = .white
       orderStatusView.layer.cornerRadius = 10

       orderStatusView.layer.shadowColor = UIColor.lightGray.cgColor
       orderStatusView.layer.shadowOpacity = 1
       orderStatusView.layer.shadowOffset = .zero
       orderStatusView.layer.shadowRadius = 10
       orderStatusView.layer.shadowOffset.height = 10
       orderStatusView.layer.shadowPath = UIBezierPath(rect: orderStatusView.bounds).cgPath
       orderStatusView.layer.shouldRasterize = true
       orderStatusView.layer.rasterizationScale = UIScreen.main.scale

       view.addSubview(orderStatusView)
   }

    private func addRecomendForYouLabel() {
        recomentForYouLabel = UILabel(frame: CGRect(
            x: forYouLabel.frame.origin.x,
            y: orderStatusView.frame.origin.y + orderStatusView.frame.height + 70,
            width: view.frame.width - 20,
            height: 20))
        recomentForYouLabel.text = "Рекомендуется вам"
        recomentForYouLabel.font = UIFont.boldSystemFont(ofSize: 25)
        recomentForYouLabel.textColor = .black
        recomentForYouLabel.textAlignment = .left
        view.addSubview(recomentForYouLabel)
    }

    private func addNotificationImageView() {
        notificationImageView = UIImageView(frame: CGRect(
            x: forYouLabel.frame.origin.x + 20,
            y: recomentForYouLabel.frame.origin.y + recomentForYouLabel.frame.height + 50,
            width: 40,
            height: 40))
        notificationImageView.image = UIImage(named: "square")
        notificationImageView.backgroundColor = .lightGray
        view.addSubview(notificationImageView)
    }

    private func addGetNewsLabel() {
        getNewsLabel = UILabel(frame: CGRect(
            x: notificationImageView.frame.origin.x + notificationImageView.frame.width + 30,
            y: notificationImageView.frame.origin.y,
            width: 250,
            height: 40))
        getNewsLabel.text = "Получайте новости о совем зазказе в режиме реального времени."
        getNewsLabel.lineBreakMode = .byWordWrapping
        getNewsLabel.numberOfLines = 0
        getNewsLabel.font = UIFont.boldSystemFont(ofSize: 15)
        getNewsLabel.textColor = .black
        getNewsLabel.textAlignment = .left
        view.addSubview(getNewsLabel)
    }

    private func addActivateNotificationLabel() {
        activateNotificationLabel = UILabel(frame: CGRect(
            x: getNewsLabel.frame.origin.x,
            y: getNewsLabel.frame.origin.y + getNewsLabel.frame.height + 5,
            width: 250,
            height: 40))
        activateNotificationLabel.text = "Включите уведомления чтобы получать новости о совем заказе."
        activateNotificationLabel.lineBreakMode = .byWordWrapping
        activateNotificationLabel.numberOfLines = 0
        activateNotificationLabel.font = UIFont.systemFont(ofSize: 13)
        activateNotificationLabel.textColor = .lightGray
        activateNotificationLabel.textAlignment = .left
        view.addSubview(activateNotificationLabel)
    }

    private func addNotificationButton() {
        notificationButton = UIButton(frame: CGRect(
            x: getNewsLabel.frame.origin.x + getNewsLabel.frame.width + 10,
            y: getNewsLabel.frame.origin.y + getNewsLabel.frame.height - 10,
            width: 30,
            height: 30))
        notificationButton.setImage(UIImage(systemName: "chevron.forward"), for: .normal)
        notificationButton.tintColor = .lightGray
        view.addSubview(notificationButton)
    }

    private func addBottomGreyLineView() {
        bottomGreyLineView.frame = CGRect(
            x: forYouLabel.frame.origin.x,
            y: activateNotificationLabel.frame.origin.y + activateNotificationLabel.frame.height + 15,
            width: view.frame.width,
            height: 0.5)
        bottomGreyLineView.backgroundColor = .lightGray
        view.addSubview(bottomGreyLineView)
    }

    private func addYourDevicesLabel() {
        yourDevicesLabel = UILabel(frame: CGRect(
            x: forYouLabel.frame.origin.x,
            y: bottomGreyLineView.frame.origin.y + bottomGreyLineView.frame.height + 40,
            width: 300,
            height: 20))
        yourDevicesLabel.text = "ваши устройства"
        yourDevicesLabel.font = UIFont.boldSystemFont(ofSize: 20)
        yourDevicesLabel.textColor = .black
        yourDevicesLabel.textAlignment = .left
        view.addSubview(yourDevicesLabel)
    }

    private func addShowAllDevicesLabel() {
        showAllDevicesLabel = UILabel(frame: CGRect(
            x: yourDevicesLabel.frame.origin.x + yourDevicesLabel.frame.width - 50,
            y: yourDevicesLabel.frame.origin.y,
            width: 150,
            height: 30))

        showAllDevicesLabel.textColor = .link
        showAllDevicesLabel.text = "Показать все"
        showAllDevicesLabel.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(showAllDevicesLabel)
    }

    private func addGestoreRecognizer() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(setImageAction))
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(tapRecognizer)
    }

    // MARK: @objc private func

    @objc private func setImageAction() {
        avatarImagePickerController.sourceType = .photoLibrary
        avatarImagePickerController.allowsEditing = true
        present(avatarImagePickerController, animated: true)
    }
}

extension ForYouScreenViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
        guard let image = info[.originalImage] as? UIImage else { return }
        avatarImageView.image = image
        navigationController?.dismiss(animated: true)
    }
}
