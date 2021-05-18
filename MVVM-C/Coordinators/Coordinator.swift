import UIKit

protocol Coordinator: AnyObject {
    var childCoordinator: Coordinator? { get set }
    var parentCoordinator: Coordinator? { get set }

    var navigationController: UINavigationController { get set }

    func dismiss(_ child: Coordinator?)
    func navigateBack()
}

//Default method implementations
extension Coordinator {
    func dismiss(_ child: Coordinator? = nil) {
        child?.parentCoordinator?.childCoordinator = nil
        navigationController.dismiss(animated: true, completion: nil)
    }

    func navigateBack() {
        navigationController.popViewController(animated: true)
    }
}
