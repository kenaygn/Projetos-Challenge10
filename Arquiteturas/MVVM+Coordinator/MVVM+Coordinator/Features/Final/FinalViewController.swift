//
//  FinalViewController.swift
//  MVVM+Coordinator
//
//  Created by Kenay on 08/11/25.
//

import Foundation
import UIKit

class FinalViewController: UIViewController {
    let viewModel: FinalViewModel
    let coordinator: FinalCoordinator

    init(viewModel: FinalViewModel, coordinator: FinalCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red

        let label = UILabel()
        label.text = viewModel.message
        label.textAlignment = .center

        let backOne = UIButton(type: .system)
        backOne.setTitle("Voltar 1 fluxo", for: .normal)
        backOne.addTarget(self, action: #selector(goBackOne), for: .touchUpInside)

        let backHome = UIButton(type: .system)
        backHome.setTitle("Voltar Home", for: .normal)
        backHome.addTarget(self, action: #selector(goHome), for: .touchUpInside)

        label.frame = CGRect(x: 40, y: 120, width: 300, height: 40)
        backOne.frame = CGRect(x: 40, y: 200, width: 300, height: 40)
        backHome.frame = CGRect(x: 40, y: 260, width: 300, height: 40)

        view.addSubview(label)
        view.addSubview(backOne)
        view.addSubview(backHome)
    }

    @objc func goBackOne() {
        coordinator.goBackOneFlow()
    }

    @objc func goHome() {
        coordinator.goToHome()
    }
}
