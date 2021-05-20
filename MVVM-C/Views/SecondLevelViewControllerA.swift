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
        title = String(describing: Self.self)

        navigationController?.presentationController?.delegate = self
    }

    deinit {
        print("\(String(describing: Self.self)) deinit")
    }
}

// NOT called if the modal is full screen
extension SecondLevelViewControllerA {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        coordinator?.dismiss()
    }
}
