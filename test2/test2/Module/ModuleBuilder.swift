//
//  ModuleBuilder.swift
//  test2
//
//  Created by a.akhmadiev on 22.11.2021.
//

import UIKit

final class ModuleBuilder {

    static func buildAuthChoiceModule(moduleOutput: AuthChoiceModuleOutput) -> UIViewController {
        let vc = AuthChoiceViewController()
        vc.moduleOutput = moduleOutput
        return vc
    }

    static func buildSignUpLoginModule(moduleOutput: SignUpModuleOutput) -> UIViewController {
        let vc = SignUpLoginViewController()
        vc.moduleOutput = moduleOutput
        return vc
    }

    static func buildSignUpPasswordModule(moduleOutput: SignUpModuleOutput) -> UIViewController {
        let vc = SignUpPasswordViewController()
        vc.moduleOutput = moduleOutput
        return vc
    }

    static func buildSignInModule(moduleOutput: SignInModuleOutput) -> UIViewController {
        let vc = SignInViewController()
        vc.moduleOutput = moduleOutput
        return vc
    }

    static func buildJokeModule(moduleOutput: JokesModuleOutput) -> UIViewController {
        let vc = JokesViewController()
        vc.moduleOutput = moduleOutput
        return vc
    }
}

