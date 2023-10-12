//
//  ExtensionUIView.swift
//  Navigation
//
//  Created by Денис Ярошко on 07.02.2023.
//

import UIKit

public extension UIView {
    func addSubviews(_ subviews: UIView...) {
        for i in subviews {
            self.addSubview(i)
        }
    }
} 
