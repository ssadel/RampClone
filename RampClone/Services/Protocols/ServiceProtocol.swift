//
//  ServiceProtocol.swift
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
