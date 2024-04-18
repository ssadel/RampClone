//
//  ButtonStyle+Ex.swift
//  RampClone
//
//  Created by Sidney Sadel on 4/18/24.
//

import SwiftUI

extension ButtonStyle where Self == InteractiveButtonStyle {
    static func interactive(scale: CGFloat = 0.925, shouldOpacity: Bool = false, timeoutDuration: TimeInterval? = nil) -> InteractiveButtonStyle {
        return InteractiveButtonStyle(scale: scale, shouldOpacity: shouldOpacity, timeoutDuration: timeoutDuration)
    }
    
    static var interactive: InteractiveButtonStyle {
        return InteractiveButtonStyle()
    }
}

struct InteractiveButtonStyle: ButtonStyle {
    @State private var isPressed: Bool = false
    @State private var isLongPress: Bool = false
    @State private var isLongPressTimer: Timer?
    @State private var isTimeoutActive: Bool = false
    
    private let peakScaleValue: CGFloat
    private let shouldOpacity: Bool
    private let timeoutDuration: TimeInterval?
    
    private var scaleValue: CGFloat {
        isPressed ? peakScaleValue : 1.0
    }
    
    init(scale: CGFloat = 0.925, shouldOpacity: Bool = false, timeoutDuration: TimeInterval? = nil) {
        self.peakScaleValue = scale
        self.shouldOpacity = shouldOpacity
        self.timeoutDuration = timeoutDuration
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(scaleValue)
            .animation(.easeOut(duration: 0.12), value: isPressed)
            .opacity(shouldOpacity ? (configuration.isPressed ? 0.8 : 1.0) : 1.0)
            .contentShape(RoundedRectangle(cornerRadius: 2))
            .allowsHitTesting(!isTimeoutActive)
            .onChange(of: configuration.isPressed) { b in
                if b {
                    onPress()
                } else {
                    onRelease()
                }
            }
    }
    
    private func onPress() {
        withAnimation { isPressed = true }
        isLongPressTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
            isLongPress = true
        }
    }
    
    private func onRelease() {
        isLongPressTimer?.invalidate()
        if !isLongPress {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.12) {
                withAnimation { isPressed = false }
            }
        } else {
            withAnimation { isPressed = false }
        }
        isLongPress = false
        
        guard let timeoutDuration = timeoutDuration else { return }
        isTimeoutActive = true
        DispatchQueue.main.asyncAfter(deadline: .now() + timeoutDuration) {
            isTimeoutActive = false
        }
    }
}
