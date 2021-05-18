import Foundation
import UIKit

class BaseCoordinator: NSObject, Coordinator {
    var parentCoordinator: Coordinator? = nil

    var childCoordinator: Coordinator?

    //The root navigation view controller
    var navigationController: UINavigationController = {
        let nav = UINavigationController()
        //Customize the navigation controller here
        return nav
    }()

    //Passed in from the SceneDelegate
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        super.init()
        navigationController.delegate = self
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

    // The method that starts the apps
    func showHome() {
        let viewController = HomeViewController()
        viewController.coordinator = self
        viewController.title = String(describing: HomeViewController.self)
        navigationController.setViewControllers([viewController], animated: true)
    }
}

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

        // We’re still here – it means we’re popping the view controller, so we can check whether it’s a buy view controller
//        if let buyViewController = fromViewController as? BuyViewController {
//            // We're popping a buy view controller; end its coordinator
//            childDidFinish(buyViewController.coordinator)
//        }
    }
}




//MARK: UIApplication
extension UIApplication {
    //Source: https://stackoverflow.com/questions/26667009/get-top-most-uiviewcontroller
    class func getTopMostViewController() -> UIViewController? {
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        } else {
            return nil
        }
    }
}
