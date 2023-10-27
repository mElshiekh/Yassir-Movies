//
//  WeakReference.swift
//  YassirApp
//
//  Created by Elshiekh on 26/10/2023.
//

import Foundation

struct WeakReference<T: NSObject> {
    weak var value: T?
    init(value: T) {
        self.value = value
    }
}
