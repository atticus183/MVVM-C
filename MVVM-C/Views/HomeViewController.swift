//
//  ViewController.swift
//  MVVM-C
//
//  Created by Josh R on 5/3/21.
//

import UIKit

class HomeViewController: UIViewController {

    weak var coordinator: Coordinator?

    let presentButton: UIButton = {
        let button = UIButton()
        button.setTitle("Present", for: .normal)
        button.backgroundColor = .systemOrange
        button.frame = CGRect(x: 0, y: 0, width: 150, height: 50)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        title = String(describing: Self.self)

        presentButton.center = view.center
        view.addSubview(presentButton)

        presentationController?.delegate = self
    }

    deinit {
        print("\(String(describing: Self.self)) deinit")
    }

    @objc func buttonTapped() {
        (coordinator as? BaseCoordinator)?.showFirstLevelViewControllerA()
    }
}

extension HomeViewController {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        print("SecondVC - presentationControllerDidDismiss called")
    }

    func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
        print("SecondVC - presentationControllerWillDismiss called")
    }
}

