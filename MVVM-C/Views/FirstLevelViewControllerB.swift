//
//  FirstLevelViewControllerB.swift
//  MVVM-C
//
//  Created by Josh R on 5/4/21.
//

import UIKit

class FirstLevelViewControllerB: UIViewController {

    weak var coordinator: Coordinator?

    let backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.backgroundColor = .systemOrange
        button.frame = CGRect(x: 0, y: 0, width: 150, height: 50)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink

        backButton.center = view.center
        view.addSubview(backButton)

        navigationController?.presentationController?.delegate = self

        let addBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBtnTapped))
        navigationItem.rightBarButtonItem = addBtn
    }

    deinit {
        print("\(String(describing: Self.self)) deinit")
    }

    @objc func buttonTapped() {
        coordinator?.navigateBack()
    }

    @objc func addBtnTapped() {
        (coordinator as? ChildCoordinatorA)?.showSecondLevelViewControllerA()
    }
}

// NOT called if the modal is full screen
extension FirstLevelViewControllerB {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        coordinator?.dismiss()
    }
}
