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

    private lazy var newButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.setTitle("newButton..", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.drawSelf()
        newButtonConstraints()
    }

    private func newButtonConstraints() {
        self.view.addSubview(self.newButton)
        NSLayoutConstraint.activate([
            self.newButton.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.newButton.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.newButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ])

    }

    private func drawSelf() {
        view.backgroundColor = .lightGray
        self.view.addSubview(self.profileHeaderView)


        NSLayoutConstraint.activate([

            self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.profileHeaderView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.profileHeaderView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
            ])
        
    }

}
