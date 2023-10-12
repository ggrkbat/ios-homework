//
//  Photoslibrary.swift
//  Navigation
//
//  Created by Денис Ярошко on 02.10.2023.
//

import UIKit

final class Photos {
    static let shared = Photos()

    let library: [UIImage]

    private init() {
        var photos = [UIImage]()
        for i in 1...20 { photos.append((UIImage(named: "\(i)") ?? UIImage())) }
        library = photos.shuffled()
    }
}
