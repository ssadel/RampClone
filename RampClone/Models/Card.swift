//
//  Card.swift
//  RampClone
//
//  Created by Sidney Sadel on 4/18/24.
//

import Foundation

struct Card: Codable {
    var name: String
    var category: Category
    var amount: Double
    var monthlyLimit: Double
}

extension Card {
    enum Category: String, Codable {
        case travelAndEntertainment
        
        var rawValue: String {
            switch self {
            case .travelAndEntertainment:
                return "Travel & Entertainment"
            }
        }
    }
}
