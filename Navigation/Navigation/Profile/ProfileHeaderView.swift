//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Денис Ярошко on 29.01.2023.
//

import UIKit

class ProfileHeaderView: UIView {

    //MARK: Visual

    var labelName = UILabel()
    var labelStatus = UILabel()
    var imageAvatarView = UIImageView()
    var buttonStatus = UIButton()
    var textField = UITextField()

    private var statusText = "Статус"

    //MARK: Setup

    func setupUI() {
        setupLabelName()
        setupAvatarImage()
        setupLabelStatus()
        setupButtonStatus()
        buttonPressed()
        setupTextField()
        
    }

    private func setupLabelName() {
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.text = "Юзер Юзерович"
        labelName.font = .boldSystemFont(ofSize: 18)
        addSubview(labelName)
        NSLayoutConstraint.activate([
            labelName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            labelName.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 156),
            labelName.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            labelName.heightAnchor.constraint(equalToConstant: 28),
        ])
    }

    private func setupLabelStatus() {
        labelStatus.translatesAutoresizingMaskIntoConstraints = false
        labelStatus.text = statusText
        labelStatus.font = .systemFont(ofSize: 17)
        labelStatus.textColor = .darkGray
        addSubview(labelStatus)
        NSLayoutConstraint.activate([

            labelStatus.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 16),
            labelStatus.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            labelStatus.trailingAnchor.constraint(equalTo: labelName.trailingAnchor),
            labelStatus.heightAnchor.constraint(equalTo: labelName.heightAnchor),
        ])

    }

    private func setupTextField() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .darkGray
        textField.backgroundColor = .white

        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.attributedPlaceholder = NSAttributedString.init(string: "Готово...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        addSubview(textField)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: labelStatus.bottomAnchor, constant: 16),
            textField.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: labelName.trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 32),
        ])
    }

    private func setupAvatarImage() {
        imageAvatarView.translatesAutoresizingMaskIntoConstraints = false
        imageAvatarView.image = UIImage(named: "ggrk")
        imageAvatarView.layer.cornerRadius = 64
        imageAvatarView.layer.borderWidth = 3
        imageAvatarView.layer.borderColor = UIColor.white.cgColor
        imageAvatarView.clipsToBounds = true

        addSubview(imageAvatarView)

        NSLayoutConstraint.activate([
            imageAvatarView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            imageAvatarView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            imageAvatarView.widthAnchor.constraint(equalToConstant: 128),
            imageAvatarView.heightAnchor.constraint(equalTo: imageAvatarView.widthAnchor)
            ])
    }

    private func setupButtonStatus() {
        buttonStatus.translatesAutoresizingMaskIntoConstraints = false
        buttonStatus.backgroundColor = .systemBlue
        buttonStatus.layer.cornerRadius = LayoutConstants.cornerRadius
        buttonStatus.layer.shadowOffset = CGSize(width: 4, height: 4)
        buttonStatus.layer.shadowColor = UIColor.black.cgColor
        buttonStatus.layer.shadowRadius = 4
        buttonStatus.layer.shadowOpacity = 0.7
        buttonStatus.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        buttonStatus.setTitle("Установить статус", for: .normal)
        buttonStatus.setTitleColor(.white, for: .normal)
        buttonStatus.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)



        addSubview(buttonStatus)
        NSLayoutConstraint.activate([
            buttonStatus.topAnchor.constraint(equalTo: imageAvatarView.bottomAnchor, constant: 16),
            buttonStatus.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonStatus.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            buttonStatus.heightAnchor.constraint(equalToConstant: 48),
        ])
    }

    @objc private func buttonPressed() {
        labelStatus.text = statusText
       print(statusText)
    }

    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }

}
