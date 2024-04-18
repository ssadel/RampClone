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
        let endpoint: String = Environment.isDebug ?
        "https://sample_debug_endpoint.api" :
        "https://sample_prod_endpoint.api"
        
        mockAPI = .init(endpoint: endpoint)
    }
    
    func onLaunch() {}
}
