//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Денис Ярошко on 29.01.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var profileHeaderView: ProfileHeaderView = {
        let headerView = ProfileHeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.drawSelf()
        
    }

    private func drawSelf() {
        view.backgroundColor = .lightGray
        self.view.addSubview(self.profileHeaderView)

        NSLayoutConstraint.activate([
                    self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
                    self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:  16),
                    self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
                    self.profileHeaderView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 16),
                    ])
        
    }

    override func viewWillLayoutSubviews() {
        profileHeaderView.frame = view.frame
    }

}
