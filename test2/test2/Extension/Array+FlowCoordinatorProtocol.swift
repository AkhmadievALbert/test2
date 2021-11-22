//
//  Array+FlowCoordinatorProtocol.swift
//  test2
//
//  Created by a.akhmadiev on 22.11.2021.
//

import Foundation

extension Array where Element == FlowCoordinatorProtocol {

    mutating func removeFlowCoordinator<T: FlowCoordinatorProtocol>(ofType type: T.Type) {
        guard let index = firstIndex(where: { $0 is T }) else { return }

        remove(at: index)
    }

    mutating func remove<T: FlowCoordinatorProtocol>(_ flowCoordinator: T.Type) {
        removeFlowCoordinator(ofType: flowCoordinator)
    }

    func flowCoordinator<T: FlowCoordinatorProtocol>(ofType type: T.Type) -> T? {
        return first(where: { $0 is T }) as? T
    }

    func flowCoordinator<T: FlowCoordinatorProtocol>() -> T? {
        return first(where: { $0 is T }) as? T
    }

    func finishAll(
        animated: Bool,
        completion: (() -> Void)? = nil
    ) {
        guard let flowCoordinator = last else {
            completion?()
            return
        }

        flowCoordinator.finish(animated: animated) {
            var flowCoordinators = self
            flowCoordinators.removeLast()
            flowCoordinators.finishAll(animated: animated, completion: completion)
        }
    }
}
