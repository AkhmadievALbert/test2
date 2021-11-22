//
//  SignUpLoginViewController.swift
//  test2
//
//  Created by a.akhmadiev on 22.11.2021.
//

import UIKit
import SnapKit

final class SignUpLoginViewController: UIViewController {

    // MARK: Private properties

    var moduleOutput: SignUpModuleOutput?

    private let loginField: UITextField = {
        let field = UITextField()
        field.placeholder = "Login"
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

        nextButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(loginField.snp.bottom).offset(16)
        }
    }


    // MARK: Actions

    @objc private func nextTapped() {
        guard
            let login = loginField.text,
            login.trimmingCharacters(in: .whitespaces) != ""
        else {
            return
        }
        moduleOutput?.moduleWantsToOpenPasswordModule(with: login)
    }
}
