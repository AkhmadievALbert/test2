//
//  SignInModuleIO.swift
//  test2
//
//  Created by a.akhmadiev on 22.11.2021.
//

import Foundation

protocol SignInModuleOutput: AnyObject {
    func moduleWantsToOpenNextModule(login: String, password: String)
}
