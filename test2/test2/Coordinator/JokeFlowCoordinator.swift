//
//  JokeFlowCoordinator.swift
//  test2
//
//  Created by a.akhmadiev on 22.11.2021.
//

import UIKit

protocol JokeFlowCoordinatorOutput {
    func didLogout()
}

final class JokeFlowCoordinator: FlowCoordinatorProtocol {

    // MARK: Private properties

    private let navigationController: UINavigationController
    private var login: String?
    private let userService = UserDefaultsService()
    private let output: JokeFlowCoordinatorOutput




    // MARK: Lifecycle

    init(navigationController: UINavigationController,
         output: JokeFlowCoordinatorOutput) {
        self.navigationController = navigationController
        self.output = output
    }


    // MARK: Public

    func start(animated: Bool) {
        let vc = ModuleBuilder.buildJokeModule(moduleOutput: self)
        navigationController.pushViewController(vc, animated: animated)
    }

    func finish(animated: Bool, completion: (() -> ())?) {
        navigationController.dismiss(animated: animated, completion: completion)
    }
}


// MARK: - SignInModuleOutput

extension JokeFlowCoordinator: JokesModuleOutput {
    func moduleWantsToLogout() {
        output.didLogout()
    }
}
