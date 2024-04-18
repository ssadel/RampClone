//
//  AppDelegate.swift
//  RampClone
//
//  Created by Sidney Sadel on 4/18/24.
//

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        Network.shared.onLaunch()
        ServiceContainer.shared.onLaunch()
        return true
    }
}
