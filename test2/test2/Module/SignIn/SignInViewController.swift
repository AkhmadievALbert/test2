//
//  SignInViewController.swift
//  test2
//
//  Created by a.akhmadiev on 22.11.2021.
//

import UIKit
import SnapKit

final class SignInViewController: UIViewController {

    // MARK: Private properties

    var moduleOutput: SignInModuleOutput?

    private let loginField: UITextField = {
        let field = UITextField()
        field.placeholder = "Login"
        return field
    }()

    private let passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        return field
    }()

    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Next", for: .normal)
        button.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
        return button
    }()



    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }


    // MARK: Private

    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "Enter login"

        view.addSubview(loginField)
        view.addSubview(nextButton)

        loginField.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
        }

        passwordField.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(loginField.snp.bottom).offset(16)
        }

        nextButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(passwordField.snp.bottom).offset(16)
        }
    }


    // MARK: Actions

    @objc private func nextTapped() {
        guard
            let login = loginField.text,
            let password = passwordField.text,
            login.trimmingCharacters(in: .whitespaces) != "",
            password.trimmingCharacters(in: .whitespaces) != ""
        else {
            return
        }
        moduleOutput?.moduleWantsToOpenNextModule(login: login, password: password)
    }
}
