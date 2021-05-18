import Foundation
import UIKit

class ChildCoordinatorB: Coordinator {
    var childCoordinator: Coordinator?

    //The root navigation view controller
    var navigationController: UINavigationController = {
        let nav = UINavigationController()
        nav.navigationBar.prefersLargeTitles = true
        //Customize the navigation controller here
        return nav
    }()

    weak var parentCoordinator: Coordinator?

    init(parentCoordinator: Coordinator?) {
        self.parentCoordinator = parentCoordinator
    }

    deinit {
        print("\(String(describing: Self.self)) deinit called.")
    }

    // MARK: Routes to ViewControllers

    func showSecondLevelViewControllerA() {
        let viewController = SecondLevelViewControllerA()
        viewController.coordinator = self
        viewController.title = String(describing: SecondLevelViewControllerA.self)
        navigationController.setViewControllers([viewController], animated: true)
        parentCoordinator?.navigationController.present(navigationController, animated: true, completion: nil)
    }

    func showSecondLevelViewControllerB() {
        let viewController = SecondLevelViewControllerB()
        viewController.coordinator = self
        viewController.title = String(describing: SecondLevelViewControllerB.self)
        navigationController.pushViewController(viewController, animated: true)
    }
}
