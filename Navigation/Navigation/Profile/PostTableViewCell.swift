//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Денис Ярошко on 07.02.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    private var viewCount = 0

    //MARK: - UI elements

    private lazy var postAuthor: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()

    private lazy var postDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()

    private lazy var postImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFit
        return image
    }()

    private lazy var postLikes: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()

    private lazy var postViews: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()

    //MARK: - setup

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        drawSelf()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func drawSelf() {

        contentView.addSubviews(postAuthor, postImage, postDescription, postLikes, postViews)
        self.selectionStyle = .default

        NSLayoutConstraint.activate([
            postAuthor.topAnchor.constraint(equalTo: contentView.topAnchor, constant: LayoutConstants.indent),
            postAuthor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutConstants.leadingMargin),
            postAuthor.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: LayoutConstants.trailingMargin),

            postImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImage.heightAnchor.constraint(equalTo: postImage.widthAnchor, multiplier: 1.0),
            postImage.topAnchor.constraint(equalTo: postAuthor.bottomAnchor, constant: LayoutConstants.indent),

            postDescription.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: LayoutConstants.indent),
            postDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutConstants.leadingMargin),
            postDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: LayoutConstants.trailingMargin),

            postLikes.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: LayoutConstants.indent),
            postLikes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutConstants.leadingMargin),
            postLikes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -LayoutConstants.indent),

            postViews.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: LayoutConstants.indent),
            postViews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: LayoutConstants.trailingMargin),
            postViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -LayoutConstants.indent)

        ])
    }

    func postArray(post: Post) {
        postAuthor.text = post.author
        postDescription.text = post.description
        postImage.image = UIImage(named: post.image)
        postLikes.text = "Нравится: \(post.likes)"
        viewCount = post.views
        postViews.text = "Просмотров: \(viewCount)"
    }

}
