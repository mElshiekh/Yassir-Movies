//
//  UIViewController+Extensions.swift
//  YassirApp
//
//  Created by Elshiekh on 26/10/2023.
//

import UIKit

extension UIViewController {
    public static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T(nibName: String(describing: T.self), bundle: nil)
        }
        return instantiateFromNib()
    }
}
