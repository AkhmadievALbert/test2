//
//  MainFlowCoordinator.swift
//  test2
//
//  Created by a.akhmadiev on 22.11.2021.
//

import UIKit

final class MainFlowCoordinator: FlowCoordinatorProtocol {

    // MARK: Private properties

    let navigationController: UINavigationController
    private let userService = UserDefaultsService()

    private var childCoordinators: [FlowCoordinatorProtocol] = []



    // MARK: Lifecycle

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }


    // MARK: Public

    func start(animated: Bool) {
        if userService.userIsAuth() {
            openJokesModule()
        } else {
            let vc = ModuleBuilder.buildAuthChoiceModule(moduleOutput: self)
            navigationController.pushViewController(vc, animated: animated)
        }
    }

    func finish(animated: Bool, completion: (() -> ())?) {
        childCoordinators.finishAll(animated: true, completion: completion)
    }


    // MARK: Private

    private func openJokesModule() {
        let coordinator = JokeFlowCoordinator(navigationController: navigationController,
                                              output: self)
        coordinator.start(animated: true)
        childCoordinators.append(coordinator)
    }
}


// MARK: - AuthChoiceModuleOutput

extension MainFlowCoordinator: AuthChoiceModuleOutput {
    func moduleWantsToOpenSignIn() {
        let coordinator = SignInFlowCoordinator(navigationController: navigationController,
                                                output: self)
        coordinator.start(animated: true)
        childCoordinators.append(coordinator)
    }

    func moduleWantsToOpenSignUp() {
        let coordinator = SignUpFlowCoordinator(navigationController: navigationController,
                                                output: self)
        coordinator.start(animated: true)
        childCoordinators.append(coordinator)
    }
}


// MARK: - SignUpFlowCoordinatorOutput

extension MainFlowCoordinator: SignUpFlowCoordinatorOutput {
    func didFinishAuth() {
        userService.setUserAuth(isAuth: true)
        childCoordinators.finishAll(animated: false) { [weak self] in
            guard let self = self else { return }
            self.openJokesModule()
        }
    }
}


// MARK: - SignInFlowCoordinatorOutput

extension MainFlowCoordinator: SignInFlowCoordinatorOutput { }



// MARK: - JokeFlowCoordinatorOutput

extension MainFlowCoordinator: JokeFlowCoordinatorOutput {
    func didLogout() {
        childCoordinators.finishAll(animated: false) { [weak self] in
            guard let self = self else { return }
            self.openJokesModule()
        }
        userService.setUserAuth(isAuth: false)
        start(animated: true)
    }
}
