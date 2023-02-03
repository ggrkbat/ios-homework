//
//  FeedViewController.swift
//  Navigation
//
//  Created by Денис Ярошко on 23.01.2023.
//

import UIKit

class FeedViewController: UIViewController {

    var post = Post(title: "Post")

    private lazy var postStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()

    private lazy var firstPostButton: UIButton = {
        let button = UIButton()
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.setTitle("Post 1", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = LayoutConstants.cornerRadius
        button.backgroundColor = .systemBlue
        return button
    }()

    private lazy var secondPostButton: UIButton = {
        let button = UIButton()
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.setTitle("Post 2", for: .normal)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = LayoutConstants.cornerRadius
        button.backgroundColor = .systemBlue
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        drawSelf()
    }

    private func drawSelf() {
        self.view.addSubview(self.postStackView)
        self.view.addSubview(self.firstPostButton)
        self.view.addSubview(self.secondPostButton)

        self.postStackView.addArrangedSubview(self.firstPostButton)
        self.postStackView.addArrangedSubview(self.secondPostButton)

        NSLayoutConstraint.activate([
            self.postStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.postStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.postStackView.heightAnchor.constraint(equalToConstant: 220),
            self.postStackView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor)
    ])

        self.firstPostButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.secondPostButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }

    @objc func buttonAction() {
        let postViewController = PostViewController()
        postViewController.titlePost = post.title
        navigationController?.pushViewController(postViewController, animated: true)
    }

}
