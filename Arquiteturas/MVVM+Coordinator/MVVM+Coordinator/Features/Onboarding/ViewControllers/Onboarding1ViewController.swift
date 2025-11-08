//
//  Onboarding1ViewController.swift
//  MVVM+Coordinator
//
//  Created by Kenay on 08/11/25.
//

import Foundation
import UIKit


class Onboarding1ViewController: UIViewController {
    let viewModel: Onboarding1ViewModel
    let coordinator: OnboardingCoordinator

    init(viewModel: Onboarding1ViewModel, coordinator: OnboardingCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let label = UILabel()
        label.text = viewModel.title
        label.textAlignment = .center

        let btn = UIButton(type: .system)
        btn.setTitle("Próxima", for: .normal)
        btn.addTarget(self, action: #selector(nextToSecondScreen), for: .touchUpInside)

        label.frame = CGRect(x: 40, y: 150, width: 300, height: 40)
        btn.frame = CGRect(x: 40, y: 220, width: 300, height: 40)

        view.addSubview(label)
        view.addSubview(btn)
    }

    @objc func nextToSecondScreen() {
        coordinator.goToSecondScreen()
    }
}

