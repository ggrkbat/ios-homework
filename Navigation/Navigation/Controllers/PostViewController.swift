//
//  PostViewController.swift
//  Navigation
//
//  Created by Денис Ярошко on 23.01.2023.
//

import UIKit

class PostViewController: UIViewController {

    var titlePost: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        self.navigationItem.title = titlePost
        setupBarButtonItem()
    }

    private func setupBarButtonItem() {
        let barItem = UIBarButtonItem(image: UIImage(systemName: "figure.fall"), style: .plain, target: self, action: #selector(buttonClick))
        barItem.tintColor = .systemBlue
        self.navigationItem.rightBarButtonItem = barItem
    }

    @objc
    private func buttonClick() {
    navigationController?.present(InfoViewController(), animated: true)
    }


}


