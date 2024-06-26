//
//  View+Ex.swift
//  RampClone
//
//  Created by Sidney Sadel on 4/18/24.
//

import SwiftUI

extension View {
    func applyFadeOutMask(size: CGFloat = 10,
                             edges: [VerticalEdge] = [.top, .bottom]) -> some View {
        self
            .mask(
                VStack(spacing: 0) {
                    if edges.contains(.top) {
                        LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0), Color.black]), startPoint: .top, endPoint: .bottom)
                            .frame(height: size)
                    }
                    LinearGradient(gradient: Gradient(colors: [Color.black, Color.black]), startPoint: .top, endPoint: .bottom)
                    if edges.contains(.bottom) {
                        LinearGradient(gradient: Gradient(colors: [Color.black, Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom)
                            .frame(height: size)
                    }
                }
            )
    }
    
    func applySheetStyling() -> some View {
        self
            .presentationDragIndicator(.visible)
            .presentationDetents([.fraction(0.99)], selection: .constant(.fraction(0.99)))
            .presentationCornerRadius(25)
    }
}
