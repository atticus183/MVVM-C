import Foundation
import UIKit

class ChildCoordinatorB: Coordinator {
    var childCoordinator: Coordinator?
    weak var parentCoordinator: Coordinator?

    var navigationController: UINavigationController?

    init(parentCoordinator: Coordinator?) {
        self.parentCoordinator = parentCoordinator
    }

    deinit {
        print("\(String(describing: Self.self)) deinit called.")
    }

    // MARK: Routes to ViewControllers

    func showSecondLevelViewControllerA(style: PresentationStyle) {
        let viewController = SecondLevelViewControllerA()
        viewController.coordinator = self
        switch style {
        case .present:
            navigationController = UINavigationController(rootViewController: viewController)
            parentCoordinator?.navigationController?.present(navigationController!, animated: true, completion: nil)
        case .push:
            parentCoordinator?.navigationController?.pushViewController(viewController, animated: true)
        }
    }

    func showSecondLevelViewControllerB(style: PresentationStyle) {
        let viewController = SecondLevelViewControllerB()
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
}
