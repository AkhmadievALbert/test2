//
//  SignUpModuleIO.swift
//  test2
//
//  Created by a.akhmadiev on 22.11.2021.
//

import Foundation

protocol SignUpModuleOutput: AnyObject {
    func moduleWantsToOpenPasswordModule(with login: String)
    func moduleWantsToOpenNextModule(with password: String)
}
