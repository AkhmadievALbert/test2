//
//  SignInFlowCoordinator.swift
//  test2
//
//  Created by a.akhmadiev on 22.11.2021.
//

import UIKit

protocol SignInFlowCoordinatorOutput {
    func didFinishAuth()
}

final class SignInFlowCoordinator: FlowCoordinatorProtocol {

    // MARK: Private properties

    private let navigationController: UINavigationController
    private var login: String?
    private let userService = UserDefaultsService()
    private let output: SignInFlowCoordinatorOutput




    // MARK: Lifecycle

    init(navigationController: UINavigationController,
         output: SignInFlowCoordinatorOutput) {
        self.navigationController = navigationController
        self.output = output
    }


    // MARK: Public

    func start(animated: Bool) {
        let vc = ModuleBuilder.buildSignInModule(moduleOutput: self)
        navigationController.pushViewController(vc, animated: animated)
    }

    func finish(animated: Bool, completion: (() -> ())?) {
        navigationController.dismiss(animated: animated, completion: completion)
    }
}


// MARK: - SignInModuleOutput

extension SignInFlowCoordinator: SignInModuleOutput {
    func moduleWantsToOpenNextModule(login: String, password: String) {
        if userService.isUserContains(login: login, password: password) { output.didFinishAuth() }
    }
}
