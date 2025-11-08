//
//  HomeViewController.swift
//  MVVM+Coordinator
//
//  Created by Kenay on 08/11/25.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    let viewModel: HomeViewModel
    let coordinator: HomeCoordinator

    init(viewModel: HomeViewModel, coordinator: HomeCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green

        let label = UILabel()
        label.text = viewModel.user.name
        label.textAlignment = .center

        let btn = UIButton(type: .system)
        btn.setTitle("Ir para Details", for: .normal)
        btn.addTarget(self, action: #selector(go), for: .touchUpInside)

        label.frame = CGRect(x: 40, y: 150, width: 300, height: 40)
        btn.frame = CGRect(x: 40, y: 220, width: 300, height: 40)

        view.addSubview(label)
        view.addSubview(btn)
    }

    @objc func go() {
        coordinator.startDetailsFlow()
    }
}
