//
//  AuthChoiceViewController.swift
//  test2
//
//  Created by a.akhmadiev on 22.11.2021.
//

import UIKit
import SnapKit

final class AuthChoiceViewController: UIViewController {

    // MARK: Private properties

    var moduleOutput: AuthChoiceModuleOutput?

    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign in", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        return button
    }()

    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
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
        title = "Hello 👋"

        view.addSubview(signInButton)
        view.addSubview(signUpButton)

        signInButton.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
        }

        signUpButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(signInButton.snp.bottom).offset(16)
        }
    }


    // MARK: Actions

    @objc private func signInTapped() {
        moduleOutput?.moduleWantsToOpenSignIn()
    }

    @objc private func signUpTapped() {
        moduleOutput?.moduleWantsToOpenSignUp()
    }
}
