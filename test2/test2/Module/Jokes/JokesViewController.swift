//
//  JokesViewController.swift
//  test2
//
//  Created by a.akhmadiev on 22.11.2021.
//

import UIKit
import SnapKit

final class JokesViewController: UIViewController {

    // MARK: Private data structure

    private enum Constants {
        static let defaultInset: CGFloat = 16
        static let textHeight: CGFloat = 350
        static let stringURL = "https://www.boredapi.com/api/activity"
    }

    // MARK: Private properties

    private let jokeService = JokeService()
    var moduleOutput: JokesModuleOutput?

    private let jokeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private let logoutButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.red, for: .normal)
        button.setTitle("Logout", for: .normal)
        button.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        return button
    }()



    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        getNewJoke()
    }


    // MARK: Private

    private func setupView() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Jokes"

        view.addSubview(jokeLabel)
        view.addSubview(logoutButton)

        jokeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Constants.defaultInset)
            $0.height.equalTo(Constants.textHeight)
            $0.leading.trailing.equalToSuperview().inset(Constants.defaultInset)
        }

        logoutButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(Constants.defaultInset)
            $0.top.equalTo(jokeLabel.snp.bottom).offset(Constants.defaultInset)
        }
    }

    private func getNewJoke() {
        jokeService.getNewJoke { [weak self] result in
            switch result {
            case .success(let string):
                DispatchQueue.main.async {
                    self?.jokeLabel.text = string
                }

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }


    // MARK: Actions

    @objc private func logoutTapped() {
        moduleOutput?.moduleWantsToLogout()
    }

    @objc private func resetTapped() {
        getNewJoke()
    }
}
