//
//  Coordinator.swift
//  MVVM+Coordinator
//
//  Created by Kenay on 08/11/25.
//

import Foundation

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set}
    func start()
}

extension Coordinator {
    func addChild(_ child: Coordinator) {
        childCoordinators.append(child)
    }

    func removeChild(_ child: Coordinator) {
        childCoordinators.removeAll { $0 === child }
    }

    func removeAllChildren() {
        childCoordinators.removeAll()
    }
}
