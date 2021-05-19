import Foundation
import UIKit

class ChildCoordinatorA: Coordinator {
    var childCoordinator: Coordinator?
    weak var parentCoordinator: Coordinator?

    var navigationController: UINavigationController?

    init(parentCoordinator: Coordinator) {
        self.parentCoordinator = parentCoordinator
    }

    deinit {
        print("\(String(describing: Self.self)) deinit called.")
    }

    // Only used if the presenting vc is full screen and the delegate method is not called.
//    func didFinish() {
//        parentCoordinator?.navigationController?.dismiss(animated: true, completion: nil)
//        navigationController?.dismiss(animated: true, completion: nil)
//        parentCoordinator?.childCoordinator = nil
//    }

    // MARK: Routes

    func showFirstLevelViewControllerA(style: PresentationStyle) {
        let viewController = FirstLevelViewControllerA()
        viewController.coordinator = self
        switch style {
        case .present:
            navigationController = UINavigationController(rootViewController: viewController)
            navigationController?.modalPresentationStyle = .fullScreen
            parentCoordinator?.navigationController?.present(navigationController!, animated: true, completion: nil)
        case .push:
            parentCoordinator?.navigationController?.pushViewController(viewController, animated: true)
        }
    }

    func showFirstLevelViewControllerB(style: PresentationStyle) {
        let viewController = FirstLevelViewControllerB()
        viewController.coordinator = self
        switch style {
        case .present:
            navigationController = UINavigationController(rootViewController: viewController)
            parentCoordinator?.navigationController?.present(navigationController!, animated: true, completion: nil)
        case .push:
            if navigationController!.viewControllers.count > 0 {
                navigationController?.pushViewController(viewController, animated: true)
            } else {
                parentCoordinator?.navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }

    //Creates child coordinator
    func showSecondLevelViewControllerA() {
        childCoordinator = ChildCoordinatorB(parentCoordinator: self)
        (childCoordinator as? ChildCoordinatorB)?.showSecondLevelViewControllerB(style: .present)
    }
}




