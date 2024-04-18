//
//  Environment.swift
//  RampClone
//
//  Created by Sidney Sadel on 4/18/24.
//

import Foundation

struct Environment {
    static var isDebug: Bool {
        #if DEBUG
            return true
        #else
            return false
        #endif
    }
}
