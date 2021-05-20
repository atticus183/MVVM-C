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
        navigate(to: viewController, with: style)
    }

    func showSecondLevelViewControllerB(style: PresentationStyle) {
        let viewController = SecondLevelViewControllerB()
        viewController.coordinator = self
        navigate(to: viewController, with: style)
    }
}
