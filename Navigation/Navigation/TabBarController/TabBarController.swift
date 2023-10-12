//
//  TabBarController.swift
//  Navigation
//
//  Created by Денис Ярошко on 23.01.2023.
//

import UIKit

class TabBarController: UITabBarController {

//    var feedViewController: UINavigationController!
//    var profileViewController: UINavigationController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    private func setupUI() {
        let loginVC = LoginViewController()
        let profileNC = UINavigationController.init(rootViewController: loginVC)
        profileNC.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "figure.walk"), tag: 0)


        let feedVC = FeedViewController()
        let feedNC = UINavigationController.init(rootViewController: feedVC)
        feedNC.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "bolt.horizontal.fill"), tag: 1)


        self.viewControllers = [feedNC, profileNC]

        UITabBar.appearance().tintColor = UIColor(red: 0/255.0, green: 146/255.0, blue: 248/255.0, alpha: 1.0)
        UITabBar.appearance().backgroundColor = .systemGray6

    }

}

