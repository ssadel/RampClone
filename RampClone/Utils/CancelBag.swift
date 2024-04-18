//
//  CancelBag.swift
//  RampClone
//
//  Created by Sidney Sadel on 4/18/24.
//

import Foundation
import Combine

final class CancelBag {
    private var cancellables: Set<AnyCancellable> = []

    // Stores a cancellable into the cancel bag.
    func store(_ cancellable: AnyCancellable) {
        cancellables.insert(cancellable)
    }

    // Cancels all stored cancellables.
    func cancel() {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
    }

    // Deinitializer to ensure all cancellables are cancelled when the instance of CancelBag is deallocated.
    deinit {
        cancel()
    }
}

// Extending AnyCancellable to add to CancelBag using a function.
extension AnyCancellable {
    func store(in bag: CancelBag) {
        bag.store(self)
    }
}
