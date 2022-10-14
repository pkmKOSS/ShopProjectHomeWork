//
//  ViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 22.09.2022.
//

import UIKit

/// Главный экран
final class CommonSearchScreenViewController: UIViewController {

    // MARK: - private visual components

    private var searchLabel = UILabel()
    private var searchTextField = UITextField()
    private var seenRecentlyLabel = UILabel()
    private var clearButton = UIButton()
    private var requestVariablesLabel = UILabel()
    private var scrollViewContentView = SearchScreenScrollContentView()
    private var firstRequestVariablesView = RequestVariablesView()
    private var secondRequestVariablesView = RequestVariablesView()
    private var thirdRequestVariablesView = RequestVariablesView()
    private var foursRequestVariablesView = RequestVariablesView()

    // MARK: - private properties

    private var goodsScroolView = UIScrollView()
    private var tapActionHandler: ((_ handler: [UIImage?]) -> Void)?

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavBar()
    }

    // MARK: - private funcs

    private func configureViews() {
        view.backgroundColor = .black
        configTapAction()
        addSearchLabel()
        addSearchTextField()
        addSeenRecentlyLabel()
        addClearButton()
        addGoodsScrollView()
        addRequestVariablesLabel()
        addFirstRequestVariablesView()
        addSecondRequestVariablesView()
        addThirdRequestVariablesView()
        addFoursRequestVariablesView()
    }

    private func configureNavBar() {
        navigationController?.navigationBar.backgroundColor = .clear
    }

    private func configTapAction() {
        tapActionHandler = { [weak self] images in
            let goodsViewController = GoodsViewController(images: images)
            guard let self = self else { return }
            self.navigationController?.pushViewController(goodsViewController, animated: false)
        }
    }

    private func addSearchLabel() {
        searchLabel = UILabel(frame: CGRect(
            x: 20,
            y: 100,
            width: 100,
            height: 30)
        )
        searchLabel.textColor = .white
        searchLabel.text = "Поиск"
        searchLabel.textAlignment = .left
        searchLabel.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(searchLabel)
    }

    private func addSearchTextField() {
        searchTextField = UITextField(frame: CGRect(
            x: searchLabel.frame.origin.x,
            y: searchLabel.frame.origin.y + searchLabel.frame.height + 15,
            width: view.frame.width - 20,
            height: 30)
        )
        searchTextField.backgroundColor = #colorLiteral(red: 0.109885104, green: 0.1097899005, blue: 0.1180514768, alpha: 1)
        searchTextField.borderStyle = .roundedRect
        searchTextField.attributedPlaceholder = NSAttributedString(
            string: Strings.searchTextFieldPlaceholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])

        let button = UIButton(type: .custom)
        button.imageEdgeInsets = UIEdgeInsets(
            top: 0,
            left: 5,
            bottom: 0,
            right: -5
        )
        button.frame = CGRect(
            x: CGFloat(searchTextField.frame.size.width - 25),
            y: 5,
            width: 25,
            height: 25
        )
        button.tintColor = .lightGray
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)

        searchTextField.leftView = button
        searchTextField.leftViewMode = .always
        view.addSubview(searchTextField)
    }

    private func addSeenRecentlyLabel() {
        seenRecentlyLabel = UILabel(frame: CGRect(
            x: searchTextField.frame.origin.x,
            y: searchTextField.frame.origin.y + searchTextField.frame.height + 50,
            width: 400,
            height: 30)
        )
        seenRecentlyLabel.textColor = .white
        seenRecentlyLabel.font = UIFont.boldSystemFont(ofSize: 25)
        seenRecentlyLabel.text = Strings.seenRecentlyLabeltext
        view.addSubview(seenRecentlyLabel)
    }

    private func addClearButton() {
        clearButton = UIButton(frame: CGRect(
            x: seenRecentlyLabel.frame.origin.x + seenRecentlyLabel.frame.width - 100,
            y: seenRecentlyLabel.frame.origin.y,
            width: 100,
            height: 30)
        )
        clearButton.setTitleColor(#colorLiteral(red: 0.1279068589, green: 0.3874320984, blue: 0.719091475, alpha: 1), for: .normal)
        clearButton.setTitle(Strings.clearButtonTitle, for: .normal)
        view.addSubview(clearButton)
    }

    private func addGoodsScrollView() {
        goodsScroolView = UIScrollView(frame: CGRect(
            x: seenRecentlyLabel.frame.origin.x,
            y: seenRecentlyLabel.frame.origin.y + seenRecentlyLabel.frame.height + 20,
            width: view.frame.width - 40,
            height: 200)
        )
        addScrollViewContentView()
        goodsScroolView.contentSize = CGSize(
            width: scrollViewContentView.bounds.width + 50,
            height: goodsScroolView.frame.height
        )
        view.addSubview(goodsScroolView)
    }

    private func addScrollViewContentView() {
        scrollViewContentView = SearchScreenScrollContentView(
            frame: view.bounds,
            action: tapActionHandler
        )
        goodsScroolView.addSubview(scrollViewContentView)
    }

    private func addRequestVariablesLabel() {
        requestVariablesLabel = UILabel(frame: CGRect(
            x: searchLabel.frame.origin.x,
            y: goodsScroolView.frame.origin.y + goodsScroolView.frame.height + 50,
            width: 400,
            height: 30)
        )
        requestVariablesLabel.textColor = .white
        requestVariablesLabel.text = Strings.requestVariablesLabelText
        requestVariablesLabel.textAlignment = .left
        requestVariablesLabel.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(requestVariablesLabel)
    }

    private func addFirstRequestVariablesView() {
        firstRequestVariablesView = RequestVariablesView(
            frame: CGRect(
                x: searchLabel.frame.origin.x,
                y: requestVariablesLabel.frame.origin.y + requestVariablesLabel.frame.height + 20,
                width: 400,
                height: 50
            ),
            image: UIImage(systemName: "magnifyingglass")  ?? UIImage(),
            labelText: Strings.podslabelText
        )
        firstRequestVariablesView.layer.cornerRadius = 10
        view.addSubview(firstRequestVariablesView)
    }

    private func addSecondRequestVariablesView() {
        secondRequestVariablesView = RequestVariablesView(
            frame: CGRect(
                x: searchLabel.frame.origin.x,
                y: firstRequestVariablesView.frame.origin.y + firstRequestVariablesView.frame.height + 10,
                width: 400,
                height: 50
            ),
            image: UIImage(systemName: "magnifyingglass")  ?? UIImage(),
            labelText: Strings.appleCarelabelText
        )
        secondRequestVariablesView.layer.cornerRadius = 10
        view.addSubview(secondRequestVariablesView)
    }

    private func addThirdRequestVariablesView() {
        thirdRequestVariablesView = RequestVariablesView(
            frame: CGRect(
                x: searchLabel.frame.origin.x,
                y: secondRequestVariablesView.frame.origin.y + secondRequestVariablesView.frame.height + 10,
                width: 400,
                height: 50
            ),
            image: UIImage(systemName: "magnifyingglass")  ?? UIImage(),
            labelText: Strings.beatsLabelText
        )
        thirdRequestVariablesView.layer.cornerRadius = 10
        view.addSubview(thirdRequestVariablesView)
    }

    private func addFoursRequestVariablesView() {
        foursRequestVariablesView = RequestVariablesView(
            frame: CGRect(
                x: searchLabel.frame.origin.x,
                y: thirdRequestVariablesView.frame.origin.y + thirdRequestVariablesView.frame.height + 10,
                width: 400,
                height: 50
            ),
            image: UIImage(systemName: "magnifyingglass")  ?? UIImage(),
            labelText: Strings.compareLabelText
        )
        foursRequestVariablesView.layer.cornerRadius = 10
        view.addSubview(foursRequestVariablesView)
    }
}
