//
//  UserDefaultsService.swift
//  test2
//
//  Created by a.akhmadiev on 22.11.2021.
//

import Foundation

final class UserDefaultsService {

    // MARK: Private data structures

    private enum Constants {
        static let userIsAuth: String = "userIsAuth"
    }


    // MARK: Public

    func userIsAuth() -> Bool {
        UserDefaults.standard.bool(forKey: Constants.userIsAuth)
    }

    func setUserAuth(isAuth: Bool) {
        UserDefaults.standard.set(isAuth, forKey: Constants.userIsAuth)
    }

    func saveUser(login: String, password: String) {
        UserDefaults.standard.setValue(login, forKey: password)
    }

    func isUserContains(login: String, password: String) -> Bool {
        UserDefaults.standard.string(forKey: login) == password
    }
}
