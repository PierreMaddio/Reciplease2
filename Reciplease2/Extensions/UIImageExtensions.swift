//
//  UIImageExtensions.swift
//  Reciplease2
//
//  Created by Pierre on 10/08/2022.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
    func downloaded(from link: String) {
        guard let url = URL(string: link) else { return }
        load(url: url)
    }
}
