//
//  FinalCoordinator.swift
//  MVVM+Coordinator
//
//  Created by Kenay on 08/11/25.
//

import Foundation
import UIKit

class FinalCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    weak var parent: DetailsCoordinator?
    let navigationController: UINavigationController

    init(nav: UINavigationController, parent: DetailsCoordinator) {
        self.navigationController = nav
        self.parent = parent
    }

    func start() {
        let vm = FinalViewModel()
        let vc = FinalViewController(viewModel: vm, coordinator: self)

        navigationController.pushViewController(vc, animated: true)
    }

    func goBackOneFlow() {
        navigationController.popViewController(animated: true)
        parent?.removeChild(self)
    }

    func goToHome() {
        navigationController.popToRootViewController(animated: true)
        parent?.parent?.childCoordinators.removeAll()
    }
}
