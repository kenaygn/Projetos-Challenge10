//
//  HomeCoordinator.swift
//  MVVM+Coordinator
//
//  Created by Kenay on 08/11/25.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    weak var parent: AppCoordinator?
    let navigationController: UINavigationController

    init(nav: UINavigationController, parent: AppCoordinator) {
        self.navigationController = nav
        self.parent = parent
    }

    func start() {
        let user = User(name: "Kenay", email: "kenay@example.com")
        let vm = HomeViewModel(user: user)
        let vc = HomeViewController(viewModel: vm, coordinator: self)

        navigationController.setViewControllers([vc], animated: true)
    }

    func startDetailsFlow() {
        let details = DetailsCoordinator(nav: navigationController, parent: self)
        addChild(details)
        details.start()
    }
}
