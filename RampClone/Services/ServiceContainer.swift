//
//  ServiceContainer.swift
//  RampClone
//
//  Created by Sidney Sadel on 4/18/24.
//

import Foundation

@objc protocol Service {
    @objc optional func onLaunch()
    @objc optional func onLogin()
    @objc optional func onLogout()
}

final class ServiceContainer {
    static let shared: ServiceContainer = .init()
    
    let authService: AuthService
    let services: [Service]
    
    private init() {
        self.authService = .init()
        
        self.services = [
            self.authService
        ]
    }
    
    func onLaunch() {
        for service in services {
            service.onLaunch?()
        }
    }
}
