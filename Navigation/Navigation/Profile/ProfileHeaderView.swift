//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Денис Ярошко on 29.01.2023.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {

    private var statusText = "Установите статус"
    private var avatarOrigin = CGPoint()
    private var avatarBackground = UIView()
    private var closeAvatarButton = UIButton()

    // MARK: UI elements

    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Юзер Х-кодович"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = statusText
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ggrk")
        imageView.layer.cornerRadius = 64
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = LayoutConstants.cornerRadius
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.setTitle("Установить статус", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.placeholder = " Впишите здесь статус"
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()


    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        self.drawSelf()
        tapGestureAvatar()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: Subviews, constraints

    private func drawSelf() {

        self.addSubview(self.fullNameLabel)
        self.addSubview(self.statusLabel)
        self.addSubview(self.avatarImageView)
        self.addSubview(self.setStatusButton)
        self.addSubview(self.statusTextField)

        NSLayoutConstraint.activate([


            self.fullNameLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 156),
            self.fullNameLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            self.fullNameLabel.heightAnchor.constraint(equalToConstant: 28),

            self.statusLabel.topAnchor.constraint(equalTo: self.fullNameLabel.bottomAnchor, constant: 16),
            self.statusLabel.leadingAnchor.constraint(equalTo: self.fullNameLabel.leadingAnchor),
            self.statusLabel.trailingAnchor.constraint(equalTo: self.fullNameLabel.trailingAnchor),
            self.statusLabel.heightAnchor.constraint(equalTo: self.fullNameLabel.heightAnchor),

            self.avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            self.avatarImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            self.avatarImageView.widthAnchor.constraint(equalToConstant: 128),
            self.avatarImageView.heightAnchor.constraint(equalTo: self.avatarImageView.widthAnchor),

            self.setStatusButton.topAnchor.constraint(equalTo: self.statusTextField.bottomAnchor, constant: 34),
            self.setStatusButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            self.setStatusButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            self.setStatusButton.heightAnchor.constraint(equalToConstant: 48),
            self.setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),

            self.statusTextField.topAnchor.constraint(equalTo: self.statusLabel.bottomAnchor, constant: 16),
            self.statusTextField.leadingAnchor.constraint(equalTo: self.fullNameLabel.leadingAnchor),
            self.statusTextField.trailingAnchor.constraint(equalTo: self.fullNameLabel.trailingAnchor),
            self.statusTextField.heightAnchor.constraint(equalToConstant: 32)

        ])
    }

    private func tapGestureAvatar() {

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnAvatar))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(tapGesture)

        closeAvatarButton.translatesAutoresizingMaskIntoConstraints = false
        closeAvatarButton.alpha = 0
        closeAvatarButton.backgroundColor = .clear
        closeAvatarButton.contentMode = .scaleToFill
        closeAvatarButton.setImage(UIImage(systemName: "xmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22))?.withTintColor(.black, renderingMode: .automatic), for: .normal)
        closeAvatarButton.tintColor = .black
        closeAvatarButton.addTarget(self, action: #selector(closeAvatar), for: .touchUpInside)

        avatarBackground = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        avatarBackground.backgroundColor = .darkGray
        avatarBackground.isHidden = true
        avatarBackground.alpha = 0

        addSubviews(avatarBackground, avatarImageView, closeAvatarButton)

        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 128),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor)
        ])


    }



    //MARK: Event handlers
    @objc private func tapOnAvatar() {
        avatarImageView.isUserInteractionEnabled = false

        ProfileViewController.postTableView.isScrollEnabled = false
        ProfileViewController.postTableView.cellForRow(at: IndexPath(row: 0, section: 0))?.isUserInteractionEnabled = false

        avatarOrigin = avatarImageView.center
        let size = UIScreen.main.bounds.width / avatarImageView.bounds.width

        UIView.animate(withDuration: 0.5) {
            self.avatarImageView.center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY - self.avatarOrigin.y)
            self.avatarImageView.transform = CGAffineTransform(scaleX: size, y: size)
            self.avatarImageView.layer.cornerRadius = 0
            self.avatarImageView.isHidden = false
            self.avatarImageView.alpha = 0.7
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.closeAvatarButton.alpha = 1
            }
        }
    }

    @objc private func closeAvatar() {
        UIImageView.animate(withDuration: 0.5) {
            UIImageView.animate(withDuration: 0.5) {
                self.closeAvatarButton.alpha = 0
                self.avatarImageView.center = self.avatarOrigin
                self.avatarImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.width / 2
                self.avatarBackground.alpha = 0
            }
        } completion: { _ in
            ProfileViewController.postTableView.isScrollEnabled = true
            ProfileViewController.postTableView.cellForRow(at: IndexPath(row: 0, section: 0))?.isUserInteractionEnabled = true
            self.avatarImageView.isUserInteractionEnabled = true
        }
    }

    @objc private func buttonPressed() {
        statusLabel.text = statusText
        print(statusText)
    }

    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }

}

