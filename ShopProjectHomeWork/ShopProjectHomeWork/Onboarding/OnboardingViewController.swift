//
//  OnboardingViewController.swift
//  ShopProjectHomeWork
//
//  Created by Григоренко Александр Игоревич on 16.10.2022.
//

import UIKit

/// Экран онбординга.
final class OnboardingViewController: UIViewController {

    // MARK: - private visual components

    private var onboardingImageView = UIImageView()
    private var onboardingTopLabel = UILabel()
    private var onboardingBottomLabel = UILabel()

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1) { [self] in
            appearAnimation()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        dissapearAnimation()
    }

    // MARK: - Init

    init(
        pages: PageHelper? = PageHelper(
            imageName: Strings.unkownText,
            topTitleText: Strings.unkownText,
            bottomTitleText: Strings.unkownText
        )
    ) {
        self.onboardingImageView.image = UIImage(named: pages?.imageName ?? Strings.unkownText)
        self.onboardingTopLabel.text = pages?.topTitleText
        self.onboardingBottomLabel.text = pages?.bottomTitleText
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - private funcs

    private func configureViews() {
        view.backgroundColor = .white
        addOnboardingImageView()
        addOnboardingTopLabel()
        addOnboardingBottomLabel()
    }

    private func addOnboardingImageView() {
        view.addSubview(onboardingImageView)
        onboardingImageView.translatesAutoresizingMaskIntoConstraints = false
        onboardingImageView.contentMode = .scaleAspectFill

        NSLayoutConstraint.activate([
            onboardingImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            onboardingImageView.topAnchor.constraint(equalTo: view.topAnchor),
            onboardingImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            onboardingImageView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.7)
        ])
    }

    private func addOnboardingTopLabel() {
        view.addSubview(onboardingTopLabel)
        onboardingTopLabel.translatesAutoresizingMaskIntoConstraints = false
        onboardingTopLabel.textAlignment = .center
        onboardingTopLabel.textColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)

        NSLayoutConstraint.activate([
            onboardingTopLabel.centerXAnchor.constraint(equalTo: onboardingImageView.centerXAnchor),
            onboardingTopLabel.topAnchor.constraint(equalTo: onboardingImageView.bottomAnchor, constant: +10),
            onboardingTopLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 2),
            onboardingTopLabel.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    private func addOnboardingBottomLabel() {
        view.addSubview(onboardingBottomLabel)
        onboardingBottomLabel.translatesAutoresizingMaskIntoConstraints = false
        onboardingBottomLabel.numberOfLines = 0
        onboardingBottomLabel.textAlignment = .center
        onboardingBottomLabel.lineBreakMode = .byWordWrapping
        onboardingBottomLabel.textColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        NSLayoutConstraint.activate([
            onboardingBottomLabel.centerXAnchor.constraint(equalTo: onboardingImageView.centerXAnchor),
            onboardingBottomLabel.topAnchor.constraint(equalTo: onboardingTopLabel.bottomAnchor, constant: +10),
            onboardingBottomLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 1.5),
            onboardingBottomLabel.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    private func dissapearAnimation() {
        onboardingTopLabel.alpha = 0.0
        onboardingBottomLabel.alpha = 0.0
    }

    private func appearAnimation() {
        onboardingTopLabel.alpha = 1.0
        onboardingBottomLabel.alpha = 1.0
    }
}
