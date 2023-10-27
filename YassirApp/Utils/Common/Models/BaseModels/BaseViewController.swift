//
//  BaseViewController.swift
//  YassirApp
//
//  Created by Elshiekh on 26/10/2023.
//

import UIKit

class BaseViewController: UIViewController {
    lazy var loadingActivityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()

        indicator.style = .large
        indicator.color = .white
        indicator.startAnimating()

        indicator.autoresizingMask = [
            .flexibleLeftMargin, .flexibleRightMargin,
            .flexibleTopMargin, .flexibleBottomMargin,
        ]
        indicator.hidesWhenStopped = true
        return indicator
    }()

    lazy var blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)

        blurEffectView.alpha = 0.8
        blurEffectView.autoresizingMask = [
            .flexibleWidth, .flexibleHeight,
        ]

        return blurEffectView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension BaseViewController {
    func showLoader() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.blurEffectView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            self.blurEffectView.frame = view.bounds
            view.addSubview(self.blurEffectView)

            self.loadingActivityIndicator.center = CGPoint(
                x: view.bounds.midX,
                y: view.bounds.midY
            )
            view.addSubview(self.loadingActivityIndicator)
        }
    }

    func hideLoader() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.loadingActivityIndicator.stopAnimating()
            self.loadingActivityIndicator.removeFromSuperview()
            self.blurEffectView.removeFromSuperview()
            self.blurEffectView.isHidden = true
        }
    }
}
