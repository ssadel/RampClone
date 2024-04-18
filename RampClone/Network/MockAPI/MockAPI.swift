//
//  MockAPI.swift
//  RampClone
//
//  Created by Sidney Sadel on 4/18/24.
//

import Foundation

enum MockAPIError: Error {
    case invalidEndpoint
}

final class MockAPI {
    let endpoint: String
    
    init(endpoint: String) {
        self.endpoint = endpoint
    }
    
    // Placeholder request function to simulate time passing during request
    @discardableResult
    func simulateRequest<C: Codable>(seconds: TimeInterval = 1) async throws -> C? {
//        guard let url: URL = .init(string: endpoint) else {
//            throw MockAPIError.invalidEndpoint
//        }
        try await Task.sleep(for: .seconds(seconds))
        return nil
    }
    
    @discardableResult
    func simulateRequest(seconds: TimeInterval = 1) async throws -> Any? {
//        guard let url: URL = .init(string: endpoint) else {
//            throw MockAPIError.invalidEndpoint
//        }
        try await Task.sleep(for: .seconds(seconds))
        return nil
    }
}
