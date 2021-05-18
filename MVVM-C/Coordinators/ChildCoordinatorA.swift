import Foundation
import UIKit

class ChildCoordinatorA: Coordinator {
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

//    convenience init(navigationController: UINavigationController) {
//        self.init()
//        self.navigationController = navigationController
//    }

    deinit {
        print("\(String(describing: ChildCoordinatorA.self)) deinit called.")
    }

    // MARK: Child Coordinator method
//    func childDidFinish(_ child: Coordinator?) {
//        for (index, coordinator) in childCoordinators.enumerated() {
//            if coordinator === child {
//                childCoordinators.remove(at: index)
//                break
//            }
//        }
//    }

    // MARK: Routes to ViewControllers

    func showFirstLevelViewControllerA() {
        let viewController = FirstLevelViewControllerA()
        viewController.coordinator = self
        viewController.title = String(describing: FirstLevelViewControllerA.self)
        navigationController.setViewControllers([viewController], animated: true)
        parentCoordinator?.navigationController.present(navigationController, animated: true, completion: nil)
    }

    func showFirstLevelViewControllerB() {
        let viewController = FirstLevelViewControllerB()
        viewController.coordinator = self
        viewController.title = String(describing: FirstLevelViewControllerB.self)
        navigationController.pushViewController(viewController, animated: true)
    }
}



extension UIViewController: UIAdaptivePresentationControllerDelegate {}
