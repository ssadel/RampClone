//
//  AuthService.swift
//  RampClone
//
//  Created by Sidney Sadel on 4/18/24.
//

import Foundation

final class AuthService: Service {
    enum State {
        case loading
        case authenticated
        case notAuthenticated
    }
    
    @Published private(set) var authState: State = .loading
    private let mockAPI: MockAPI = Network.shared.mockAPI
    
    func onLaunch() {
        Task { [unowned self] in
            await self.getAuthenticationStatus()
        }
    }
}

extension AuthService {
    // Simulate getting auth status
    private func getAuthenticationStatus() async {
        do {
            try await mockAPI.simulateRequest()
            self.authState = .notAuthenticated
        } catch {
            print(#function, "error: ", error)
        }
    }
}
