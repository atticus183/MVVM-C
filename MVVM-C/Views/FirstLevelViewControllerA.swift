//
//  FirstLevelViewControllerA.swift
//  MVVM-C
//
//  Created by Josh R on 5/4/21.
//

import UIKit

class FirstLevelViewControllerA: UIViewController {

    weak var coordinator: Coordinator?

    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.backgroundColor = .systemOrange
        button.frame = CGRect(x: 0, y: 0, width: 150, height: 50)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal

        navigationController?.presentationController?.delegate = self

        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeBtnTapped))

        nextButton.center = view.center
        view.addSubview(nextButton)
    }

    deinit {
        print("\(String(describing: Self.self)) deinit")
    }

    @objc func buttonTapped() {
        (coordinator as? ChildCoordinatorA)?.showFirstLevelViewControllerB(style: .push)
    }

    @objc func closeBtnTapped() {
        coordinator?.dismiss()
    }
}

// NOT called if the modal is full screen
extension FirstLevelViewControllerA {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        coordinator?.dismiss()
    }
}
