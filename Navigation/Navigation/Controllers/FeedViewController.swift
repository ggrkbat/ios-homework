//
//  FeedViewController.swift
//  Navigation
//
//  Created by Денис Ярошко on 23.01.2023.
//

import UIKit

class FeedViewController: UIViewController {

    var post = Post(title: "Post")

    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Post", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupSubView()
        setupButton()
        button.frame = CGRect(x: 100, y: 400, width: 200, height: 100)
    }

    func setupButton() {
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }

    @objc func buttonAction() {
        let postViewController = PostViewController()
        postViewController.titlePost = post.title
        navigationController?.pushViewController(postViewController, animated: true)
    }

    func setupSubView() {
        view.addSubview(button)

    }
}
