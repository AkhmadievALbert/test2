//
//  AuthChoiceModuleIO.swift
//  test2
//
//  Created by a.akhmadiev on 22.11.2021.
//

import Foundation

protocol AuthChoiceModuleOutput: AnyObject {
    func moduleWantsToOpenSignIn()
    func moduleWantsToOpenSignUp()
}
