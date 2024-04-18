//
//  Network.swift
//  RampClone
//
//  Created by Sidney Sadel on 4/18/24.
//

import Foundation

final class Network {
    static let shared: Network = .init()
    
    let mockAPI: MockAPI
    
    private init() {
        mockAPI = .init(endpoint: "https://sample_prod_endpoint.api")
    }
    
    func onLaunch() {}
}
