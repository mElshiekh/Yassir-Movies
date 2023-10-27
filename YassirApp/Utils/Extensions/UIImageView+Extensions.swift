//
//  UIImageView+Extensions.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//

import Kingfisher
import UIKit

extension UIImageView {
    func setImage(from url: URL?) {
        kf.setImage(with: url)
    }
}
