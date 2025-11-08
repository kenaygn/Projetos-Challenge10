//
//  AppCoordinator.swift
//  MVVM+Coordinator
//
//  Created by Kenay on 08/11/25.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    let navigationController: UINavigationController

    init(nav: UINavigationController) {
        self.navigationController = nav
    }

    func start() {
        showOnboarding()
    }

    func showOnboarding() {
        let onboarding = OnboardingCoordinator(nav: navigationController, parent: self)
        addChild(onboarding)
        onboarding.start()
    }

    func onboardingFinished(_ coordinator: OnboardingCoordinator) {
        removeChild(coordinator)
        showHome()
    }

    func showHome() {
        let home = HomeCoordinator(nav: navigationController, parent: self)
        addChild(home)
        home.start()
    }
}
