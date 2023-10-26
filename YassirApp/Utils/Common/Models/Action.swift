//
//  Action.swift
//  YassirApp
//
//  Created by Elshiekh on 26/10/2023.
//

import Foundation

final public class Action: NSObject {

    private let _action: () -> Void

    public init(action: @escaping () -> Void) {
        _action = action
        super.init()
    }

    @objc public func action() {
        _action()
    }
}
