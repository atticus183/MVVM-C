import Foundation
import UIKit

class BaseCoordinator: NSObject, Coordinator {
    var parentCoordinator: Coordinator?
    var childCoordinator: Coordinator?

    //The root navigation view controller IF presenting
    var navigationController: UINavigationController?

    //Passed in from the SceneDelegate
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
        super.init()

        start()
    }

    // MARK: Routes to ViewControllers

    // The method that starts the apps
    func start() {
        let viewController = HomeViewController()
        viewController.coordinator = self
        navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    func showFirstLevelViewControllerA() {
        childCoordinator = ChildCoordinatorA(parentCoordinator: self)
        (childCoordinator as? ChildCoordinatorA)?.showFirstLevelViewControllerA(style: .present)
    }
}

//Not using at this time.
extension BaseCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Read the view controller we’re moving from.
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        // Check whether our view controller array already contains that view controller. If it does it means we’re pushing a different view controller on top rather than popping it, so exit.
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
    }
}
