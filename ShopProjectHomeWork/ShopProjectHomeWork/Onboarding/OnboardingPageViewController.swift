//
//  ViewController.swift
//  ShopProjectHomeWork
//
//  Created by Григоренко Александр Игоревич on 17.10.2022.
//

import UIKit

///  Перелистывающийся экран онбординга.
final class OnboardingPageViewController: UIPageViewController {

    // MARK: - private properties

    private var onboadingPages: [PageHelper] = []
    private var pageAppearance = UIPageControl.appearance(
        whenContainedInInstancesOf: [OnboardingPageViewController.self]
    )

    // MARK: - private visual components

    private var pageViewControllers: [UIViewController] = []
    private var previusButton = UIButton()
    private var nextButton = UIButton()
    private var startButton = UIButton()

    // MARK: - lify cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configProperties()
    }

    // MARK: - Init

    override init(
        transitionStyle style: UIPageViewController.TransitionStyle,
        navigationOrientation: UIPageViewController.NavigationOrientation,
        options: [UIPageViewController.OptionsKey: Any]? = nil
    ) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: options)
        setDelegates()
        configureViews()
        setVC()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: private funcs

    private func setVC() {
        guard let firstViewController = pageViewControllers.first else { return }
        setViewControllers([firstViewController], direction: .forward, animated: true)
    }

    private func setDelegates() {
        self.delegate = self
        self.dataSource = self
    }

    private func configureViews() {

        self.view.backgroundColor = .white

        addPreviusButton()
        addNextButton()
        addStartButton()

        pageAppearance.pageIndicatorTintColor = .tertiaryLabel
        pageAppearance.currentPageIndicatorTintColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    }

    private func addPreviusButton() {
        view.addSubview(previusButton)
        previusButton.translatesAutoresizingMaskIntoConstraints = false
        previusButton.setTitle(Strings.previusTitleText, for: .normal)
        previusButton.setTitleColor(.red, for: .normal)
        previusButton.setTitleColor(#colorLiteral
                                    (red: 0.9098039269,
                                     green: 0.4784313738,
                                     blue: 0.6431372762,
                                     alpha: 1), for: .normal)

        NSLayoutConstraint.activate([
            previusButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: +50),
            previusButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: +400),
            previusButton.widthAnchor.constraint(equalToConstant: view.frame.width / 6),
            previusButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    private func addNextButton() {
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle(Strings.nextTitleText, for: .normal)
        nextButton.addTarget(self, action: #selector(goNextPageAction), for: .touchUpInside)
        nextButton.setTitleColor(#colorLiteral
                                 (red: 0.9098039269,
                                  green: 0.4784313738,
                                  blue: 0.6431372762,
                                  alpha: 1),
                                 for: .normal)

        NSLayoutConstraint.activate([
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            nextButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: +400),
            nextButton.widthAnchor.constraint(equalToConstant: view.frame.width / 10),
            nextButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    private func addStartButton() {
        view.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.isHidden = true
        startButton.setTitle(Strings.startTitleText, for: .normal)
        startButton.setTitleColor(#colorLiteral
                                  (red: 0.9098039269,
                                   green: 0.4784313738,
                                   blue: 0.6431372762,
                                   alpha: 1), for: .normal)

        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: +410),
            startButton.widthAnchor.constraint(equalToConstant: view.frame.width / 8),
            startButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    private func configProperties() {

        let firstPage = PageHelper(
            imageName: Strings.firstPageImageName,
            topTitleText: Strings.topTitleText,
            bottomTitleText: Strings.bottomTitleText)
        let secondPage = PageHelper(
            imageName: Strings.secondPageImageName,
            topTitleText: Strings.itemSecondTitleName,
            bottomTitleText: Strings.secondPageTopTitleText)
        let thirdPage = PageHelper(
            imageName: Strings.thirdPageImageName,
            topTitleText: Strings.thirdPageTopTitleText,
            bottomTitleText: Strings.thirdPagebottomTitleText)

        onboadingPages.append(firstPage)
        onboadingPages.append(secondPage)
        onboadingPages.append(thirdPage)

        configPageViewcontrollers()
    }

    private func configPageViewcontrollers() {
        navigationItem.title = Strings.pageNavigationItemTitle

        for screen in onboadingPages {
            pageViewControllers.append(OnboardingViewController.init(
                pages: screen))
        }
    }

    // MARK: @objc private methods

    @objc private func goNextPageAction(sender: UIButton) {
        guard
            let currentScreen = viewControllers?.first,
            let nextScreen = dataSource?.pageViewController(self, viewControllerAfter: currentScreen),
            let pageControl = view.subviews.first(where: { $0 is UIPageControl }) as? UIPageControl
        else { return }

        let index = pageControl.currentPage
        if nextScreen == pageViewControllers.last {
            previusButton.isHidden = true
            nextButton.isHidden = true
            startButton.isHidden = false
        }
        setViewControllers(
            [nextScreen],
            direction: .forward,
            animated: false)
        pageControl.currentPage += index + 1
    }

    @objc private func startPageAction(sender: UIButton) {
        guard
            let currentScreen = viewControllers?.first,
            let nextScreen = dataSource?.pageViewController(self, viewControllerAfter: currentScreen),
            let pageControl = view.subviews.first(where: { $0 is UIPageControl }) as? UIPageControl
        else { return }

        let index = pageControl.currentPage
        if nextScreen == pageViewControllers.last {
            previusButton.isHidden = true
            nextButton.isHidden = true
            startButton.isHidden = false
        }
        setViewControllers(
            [nextScreen],
            direction: .forward,
            animated: true)

        pageControl.currentPage += index + 1
    }
}

// методы UIPageViewControllerDataSource и UIPageViewControllerDelegate
extension OnboardingPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        guard let viewController = viewController as? OnboardingViewController else { return nil}
        if let index = pageViewControllers.firstIndex(of: viewController) {
            if index > 0 {
                return pageViewControllers[index - 1]
            }
        }
        return nil
    }

    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
        guard let viewController = viewController as? OnboardingViewController else { return nil }
        if let index = pageViewControllers.firstIndex(of: viewController) {
            if index < onboadingPages.count - 1 {
                return pageViewControllers[index + 1]
            } else {
                return pageViewControllers.first
            }
        }
        return nil
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return onboadingPages.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }

    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool
    ) {

        guard
            let viewControllers = pageViewController.viewControllers,
            let firstViewController = viewControllers.first
        else { return }

        guard let currentIndex = pageViewControllers.firstIndex(of: firstViewController) else { return }
        pageAppearance.currentPage = currentIndex

        guard currentIndex == 0 || currentIndex == 1 else {
            previusButton.isHidden = true
            nextButton.isHidden = true
            startButton.isHidden = false
            return
        }

        previusButton.isHidden = false
        nextButton.isHidden = false
        startButton.isHidden = true
    }
}
