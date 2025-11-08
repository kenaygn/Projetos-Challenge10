//
//  DetailsViewController.swift
//  MVVM+Coordinator
//
//  Created by Kenay on 08/11/25.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController {
    let viewModel: DetailsViewModel
    let coordinator: DetailsCoordinator

    init(viewModel: DetailsViewModel, coordinator: DetailsCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow

        let label = UILabel()
        label.text = viewModel.info
        label.textAlignment = .center

        let btn = UIButton(type: .system)
        btn.setTitle("Ir para Final", for: .normal)
        btn.addTarget(self, action: #selector(goFinal), for: .touchUpInside)

        label.frame = CGRect(x: 40, y: 150, width: 300, height: 40)
        btn.frame = CGRect(x: 40, y: 220, width: 300, height: 40)

        view.addSubview(label)
        view.addSubview(btn)
    }

    @objc func goFinal() {
        coordinator.startFinalFlow()
    }
}
