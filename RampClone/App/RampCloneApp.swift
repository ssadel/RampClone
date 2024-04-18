//
//  RampCloneApp.swift
//  RampClone
//
//  Created by Sidney Sadel on 4/18/24.
//

import SwiftUI

@main
struct RampCloneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            MasterView()
        }
    }
}
