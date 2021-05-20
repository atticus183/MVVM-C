import UIKit

protocol Coordinator: AnyObject {
    var childCoordinator: Coordinator? { get set }
    var parentCoordinator: Coordinator? { get set }

    var navigationController: UINavigationController? { get set }

    func dismiss()
    func navigateBack()
    func navigate(to viewController: UIViewController, with presentationStyle: PresentationStyle)
}

enum PresentationStyle {
    case present
    case push
}

//Default method implementations
extension Coordinator {
    func dismiss() {
        navigationController?.dismiss(animated: true, completion: nil)
        parentCoordinator?.childCoordinator = nil
    }

    func navigateBack() {
        navigationController?.popViewController(animated: true)
    }

    func navigate(to viewController: UIViewController, with presentationStyle: PresentationStyle) {
        switch presentationStyle {
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

/*

 NOTES:
 1) Each view controller must have the following components:
    1a) Add 'navigationController?.presentationController?.delegate = self' to viewDidLoad
    1b) Extend the vc to add the 'presentationControllerDidDismiss' delegate method.  Call the 'coordinator?.dismiss() inside the method.
    1c) weak reference to the protocol type Coordinator
 2)

*/
