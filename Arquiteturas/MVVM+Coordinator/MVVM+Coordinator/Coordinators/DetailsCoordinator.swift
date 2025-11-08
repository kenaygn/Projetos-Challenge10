//
//  DetailsCoordinator.swift
//  MVVM+Coordinator
//
//  Created by Kenay on 08/11/25.
//

import Foundation
import UIKit

class DetailsCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    weak var parent: HomeCoordinator?
    let navigationController: UINavigationController

    init(nav: UINavigationController, parent: HomeCoordinator) {
        self.navigationController = nav
        self.parent = parent
    }

    func start() {
        let vm = DetailsViewModel()
        let vc = DetailsViewController(viewModel: vm, coordinator: self)

        navigationController.pushViewController(vc, animated: true)
    }

    func startFinalFlow() {
        let final = FinalCoordinator(nav: navigationController, parent: self)
        addChild(final)
        final.start()
    }

    func goBackToDetailsRoot() {
        navigationController.popViewController(animated: true)
        parent?.removeChild(self)
    }

    func goToHome() {
        navigationController.popToRootViewController(animated: true)
        parent?.childCoordinators.removeAll()
    }
}
