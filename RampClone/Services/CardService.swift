//
//  CardService.swift
//  RampClone
//
//  Created by Sidney Sadel on 4/18/24.
//

import Foundation

enum CardServiceError: Error {
    case alreadyFetching
}

final class CardService: Service {
    @Published private(set) var card: Card?
    @Published private(set) var fetchCardState: FetchState = .none
    
    private let mockAPI: MockAPI = Network.shared.mockAPI
    
    func onLogin() {
        Task { [unowned self] in
            try? await fetchCard()
        }
    }
}

extension CardService {
    @discardableResult
    func fetchCard() async throws -> Card {
        self.fetchCardState = .fetching
        defer {
            self.fetchCardState = .none
        }
        guard self.fetchCardState != .fetching else {
            throw CardServiceError.alreadyFetching
        }
        try await mockAPI.simulateRequest(seconds: 0.5)
        let card: Card = .init(name: "Sid",
                               category: .travelAndEntertainment,
                               amount: 933.55,
                               monthlyLimit: 2500)
        self.card = card
        return card
    }
}
