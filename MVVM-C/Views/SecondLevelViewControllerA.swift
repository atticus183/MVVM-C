//
//  SecondLevelViewControllerA.swift
//  MVVM-C
//
//  Created by Josh R on 5/4/21.
//

import UIKit

class SecondLevelViewControllerA: UIViewController {

    weak var coordinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed

        navigationController?.presentationController?.delegate = self
    }

    deinit {
        print("\(String(describing: Self.self)) deinit")
    }
}

extension SecondLevelViewControllerA {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        coordinator?.dismiss(coordinator)
    }
}
