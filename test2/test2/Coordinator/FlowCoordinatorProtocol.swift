//
//  FlowCoordinatorProtocol.swift
//  test2
//
//  Created by a.akhmadiev on 22.11.2021.
//

import Foundation

protocol FlowCoordinatorProtocol {
    func start(animated: Bool)
    func finish(animated: Bool, completion: (() -> ())?)
}
