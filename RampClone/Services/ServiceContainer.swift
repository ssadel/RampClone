//
//  ServiceContainer.swift
//  RampClone
//
//  Created by Sidney Sadel on 4/18/24.
//

import Foundation

final class ServiceContainer {
    static let shared: ServiceContainer = .init()
    
    let authService: AuthService
    let services: [Service]
    
    private let cancelBag: CancelBag = .init()
    
    private init() {
        self.authService = .init()
        
        self.services = [
            self.authService
        ]
        
        self.observeAuthState()
    }
    
    func onLaunch() {
        print("🚀 ServiceContainer: ", #function)
        for service in services {
            service.onLaunch?()
        }
    }
    
    func onLogin() {
        print("🚀 ServiceContainer: ", #function)
        for service in services {
            service.onLogin?()
        }
    }
    
    func onLogOut() {
        print("🚀 ServiceContainer: ", #function)
        for service in services {
            service.onLogout?()
        }
    }
}

extension ServiceContainer {
    private func observeAuthState() {
        authService.$authState
            .sink { [unowned self] state in
                switch state {
                case .authenticated:
                    self.onLogin()
                case .notAuthenticated:
                    self.onLogOut()
                default: break
                }
            }
            .store(in: cancelBag)
    }
}
