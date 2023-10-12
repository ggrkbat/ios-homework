//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Денис Ярошко on 02.10.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    //MARK: Visual objects

    private lazy var labelPhotos: UILabel = {
        let labelPhotos = UILabel()
        labelPhotos.translatesAutoresizingMaskIntoConstraints = false
        labelPhotos.text = "Фото"
        labelPhotos.font = .systemFont(ofSize: 24, weight: .bold)
        labelPhotos.textColor = .black
        return labelPhotos
     }()

    private lazy var arrowImage: UIImageView = {
        let arrowImage = UIImageView()
        arrowImage.translatesAutoresizingMaskIntoConstraints = false
        arrowImage.image = UIImage(systemName: "arrow.right")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        return arrowImage
    }()

    private lazy var imageStackView: UIStackView = {
        let imageStackView = UIStackView()
        imageStackView.translatesAutoresizingMaskIntoConstraints = false
        imageStackView.axis = .horizontal
        imageStackView.alignment = .center
        imageStackView.distribution = .fillEqually
        imageStackView.spacing = 8
        return imageStackView
    }()

    func getPreviewImage(index: Int) -> UIImageView {
        let preview = UIImageView()
        preview.translatesAutoresizingMaskIntoConstraints = false
        preview.image = Photos.shared.library[index]
        preview.contentMode = .scaleAspectFill
        preview.layer.cornerRadius = 6
        preview.clipsToBounds = true
        return preview
    }

    //MARK: Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubviews(labelPhotos, arrowImage, imageStackView)
        setupPreviews()
        setupConstraints()


    }

    required init?(coder: NSCoder) {
        fatalError("Error!")
    }

    //MARK: preview
    private func setupPreviews() {
        for ind in 0...3 {
            let image = getPreviewImage(index: ind)
            imageStackView.addArrangedSubview(image)
            NSLayoutConstraint.activate([
                image.widthAnchor.constraint(greaterThanOrEqualToConstant: (contentView.frame.width - 24) / 4),
                image.heightAnchor.constraint(equalTo: image.widthAnchor, multiplier: 0.56)
            ])
        }
    }
    private func setupConstraints() {
            NSLayoutConstraint.activate([
                labelPhotos.topAnchor.constraint(equalTo: contentView.topAnchor, constant: LayoutConstants.indentTwelve),
                labelPhotos.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutConstants.indentTwelve),
                labelPhotos.widthAnchor.constraint(equalToConstant: 80),
                labelPhotos.heightAnchor.constraint(equalToConstant: 40),

                arrowImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -LayoutConstants.indentTwelve),
                arrowImage.centerYAnchor.constraint(equalTo: labelPhotos.centerYAnchor),
                arrowImage.heightAnchor.constraint(equalToConstant: 40),
                arrowImage.widthAnchor.constraint(equalToConstant: 40),

                imageStackView.topAnchor.constraint(equalTo: labelPhotos.bottomAnchor, constant: LayoutConstants.indentTwelve),
                imageStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutConstants.indentTwelve),
                imageStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -LayoutConstants.indentTwelve),
                imageStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -LayoutConstants.indentTwelve),

            ])
        }
    }




