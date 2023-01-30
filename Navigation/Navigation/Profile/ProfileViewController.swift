//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Денис Ярошко on 29.01.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    var profileHeaderView: ProfileHeaderView = {
          let view = ProfileHeaderView()
          return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        profileHeaderView.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
        profileHeaderView.setupUI()

    }
    
    override func viewWillLayoutSubviews() {
        profileHeaderView.frame = view.frame
    }

}
