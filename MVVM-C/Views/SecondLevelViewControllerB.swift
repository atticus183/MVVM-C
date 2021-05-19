//
//  SecondLevelViewControllerB.swift
//  MVVM-C
//
//  Created by Josh R on 5/4/21.
//

import UIKit

class SecondLevelViewControllerB: UIViewController {

    weak var coordinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationController?.presentationController?.delegate = self
    }

    @objc func addButtonTapped() {
        print("Button tapped")
    }

    deinit {
        print("\(String(describing: Self.self)) deinit")
    }
}

// NOT called if the modal is full screen
extension SecondLevelViewControllerB {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        coordinator?.dismiss()
    }
}
