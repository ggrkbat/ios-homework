//
//  TabBarController.swift
//  Navigation
//
//  Created by Денис Ярошко on 23.01.2023.
//

import UIKit

class TabBarController: UITabBarController {

    var feedViewController: UINavigationController!
    var profileViewController: UINavigationController!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {

        feedViewController = UINavigationController.init(rootViewController: FeedViewController())
        profileViewController = UINavigationController.init(rootViewController: ProfileViewController())

        self.viewControllers = [feedViewController, profileViewController]

        let item1 = UITabBarItem(title: "Лента", image: UIImage(systemName: "bolt.horizontal.fill"), tag: 0)
        let item2 = UITabBarItem(title: "Профиль", image: UIImage(systemName: "figure.walk"), tag: 1)

        feedViewController.tabBarItem = item1
        profileViewController.tabBarItem = item2

        UITabBar.appearance().tintColor = UIColor(red: 0/255.0, green: 146/255.0, blue: 248/255.0, alpha: 1.0)
        UITabBar.appearance().backgroundColor = .systemGray6

    }



}
