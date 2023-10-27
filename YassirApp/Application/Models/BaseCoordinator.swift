//
//  BaseCoordinator.swift
//  YassirApp
//
//  Created by Elshiekh on 26/10/2023.
//

import Combine
import UIKit

class BaseCoordinator: NSObject {
    public enum CoordinatorPresentationTypes: Equatable {
        case push
        case present
        case root
    }

    var navigationController: UINavigationController?
    var cancellables = Set<AnyCancellable>()

    func showMessageAlert(title: String,
                   message: String,
                   action: Action?) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        if let action = action {
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                action.action()
            }))
        }
        navigationController?.present(alertController, animated: true, completion: nil)
    }
}

