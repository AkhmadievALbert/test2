//
//  SignUpFlowCoordinator.swift
//  test2
//
//  Created by a.akhmadiev on 22.11.2021.
//

import UIKit

protocol SignUpFlowCoordinatorOutput {
    func didFinishAuth()
}

final class SignUpFlowCoordinator: FlowCoordinatorProtocol {

    // MARK: Private properties

    private let navigationController: UINavigationController
    private var login: String?
    private let userService = UserDefaultsService()
    private let output: SignUpFlowCoordinatorOutput




    // MARK: Lifecycle

    init(navigationController: UINavigationController,
         output: SignUpFlowCoordinatorOutput) {
        self.navigationController = navigationController
        self.output = output
    }


    // MARK: Public

    func start(animated: Bool) {
        let vc = ModuleBuilder.buildSignUpLoginModule(moduleOutput: self)
        navigationController.pushViewController(vc, animated: animated)
    }

    func finish(animated: Bool, completion: (() -> ())?) {
        navigationController.dismiss(animated: animated, completion: completion)
    }
}


// MARK: - SignUpModuleOutput

extension SignUpFlowCoordinator: SignUpModuleOutput {
    func moduleWantsToOpenPasswordModule(with login: String) {
        self.login = login
        let vc = ModuleBuilder.buildSignUpPasswordModule(moduleOutput: self)
        navigationController.pushViewController(vc, animated: true)
    }

    func moduleWantsToOpenNextModule(with password: String) {
        guard let login = login else { return }
        userService.saveUser(login: login, password: password)
        output.didFinishAuth()
    }
}
