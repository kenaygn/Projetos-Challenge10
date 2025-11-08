//
//  OnboardingCoodinator.swift
//  MVVM+Coordinator
//
//  Created by Kenay on 08/11/25.
//

import Foundation
import UIKit


class OnboardingCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    weak var parent: AppCoordinator?
    let navigationController: UINavigationController

    init(nav: UINavigationController, parent: AppCoordinator) {
        self.navigationController = nav
        self.parent = parent
    }

    func start() {
        let vm = Onboarding1ViewModel()
        let vc = Onboarding1ViewController(viewModel: vm, coordinator: self)
        
        navigationController.setViewControllers([vc], animated: false)
    }

    func goToSecondScreen() {
        let vm = Onboarding2ViewModel()
        let vc = Onboarding2ViewController(viewModel: vm, coordinator: self)
        
        navigationController.pushViewController(vc, animated: true)
    }

    func finishOnboarding() {
        parent?.onboardingFinished(self)
    }
}
