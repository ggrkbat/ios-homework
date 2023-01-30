//
//  InfoViewController.swift
//  Navigation
//
//  Created by Денис Ярошко on 23.01.2023.
//

import UIKit

final class InfoViewController: UIViewController {

    private let button: UIButton = {
            let button = UIButton()
            button.setTitle("В закладки", for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.setTitleColor(UIColor.systemBlue, for: .highlighted)
            button.backgroundColor = .systemBlue
            button.layer.cornerRadius = 14
            button.frame = CGRect(x: 270, y: 50, width: 100, height: 50)
            return button
        }()

    private let alertController = UIAlertController(title: "Предупреждение", message: "Вы уверены, что хотите добавить данный пост в закладки?", preferredStyle: .alert)

     private func setupAlertConfiguration() {
         let firstaction = UIAlertAction(title: "Добавить", style: .default) {_ in
             print ("Добавить")
        }
         let secondAction = UIAlertAction(title: "Отмена", style: .destructive) {_ in
             print ("Отмена")
        }

         alertController.addAction(firstaction)
         alertController.addAction(secondAction)
         alertController.view.backgroundColor = .systemIndigo
         alertController.view.tintColor = .systemGray6
     }

     private func setupButton() {
         button.addTarget(self, action: #selector(tapOnButton), for: .touchUpInside)
     }

     @objc
     private func tapOnButton() {
         self.present(alertController, animated: true)
     }

     override func viewDidLoad() {
         view.backgroundColor = .systemGray6
         view.addSubview(button)
         setupButton()
         setupAlertConfiguration()
     }



}
