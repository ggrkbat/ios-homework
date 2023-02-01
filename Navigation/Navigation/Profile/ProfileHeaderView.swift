//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Денис Ярошко on 29.01.2023.
//

import UIKit

class ProfileHeaderView: UIView {

    private var statusText = "Cтатус"

    // MARK: elemetsUI

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
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
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
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawSelf()
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

        let fullNameLabelConstraints = self.fullNameLabelConstraints()
        let statusLabelConstraints = self.statusLabelConstraints()
        let avatarImageViewConstraints = self.avatarImageViewConstraints()
        let setStatusButtonConstraints = self.setStatusButtonConstraints()
        let statusTextFieldConstraints = self.statusTextFieldConstraints()

        NSLayoutConstraint.activate(fullNameLabelConstraints +
                                    statusLabelConstraints +
                                    avatarImageViewConstraints +
                                    setStatusButtonConstraints +
                                    statusTextFieldConstraints)
    }

    private func fullNameLabelConstraints() -> [NSLayoutConstraint] {
        return [
            self.fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            self.fullNameLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 156),
            self.fullNameLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            self.fullNameLabel.heightAnchor.constraint(equalToConstant: 28),
            ]
    }

    private func statusLabelConstraints() -> [NSLayoutConstraint] {
        return [
            self.statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 16),
            self.statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            self.statusLabel.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor),
            self.statusLabel.heightAnchor.constraint(equalTo: fullNameLabel.heightAnchor),
            ]
    }

    private func avatarImageViewConstraints() -> [NSLayoutConstraint] {
        return [
            self.avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            self.avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            self.avatarImageView.widthAnchor.constraint(equalToConstant: 128),
            self.avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            ]
    }

    private func setStatusButtonConstraints() -> [NSLayoutConstraint] {
        return [
            self.setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
            self.setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            self.setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            self.setStatusButton.heightAnchor.constraint(equalToConstant: 48),
            ]
    }

    private func statusTextFieldConstraints() -> [NSLayoutConstraint] {
        return [
            self.statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 16),
            self.statusTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            self.statusTextField.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor),
            self.statusTextField.heightAnchor.constraint(equalToConstant: 32),
            ]
    }

    @objc private func buttonPressed() {
        statusLabel.text = statusText
       print(statusText)
    }

    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }

}
