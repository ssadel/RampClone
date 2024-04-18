//
//  CaptureReciptView.swift
//  RampClone
//
//  Created by Sidney Sadel on 4/18/24.
//

import SwiftUI

struct CaptureReciptView: View {
    @Binding var isActive: Bool
    
    var body: some View {
        Color.black.ignoresSafeArea()
            .overlay(
                VStack {
                    Button {
                        isActive = false
                    } label: {
                        Text("Go Back")
                            .foregroundStyle(.white)
                    }
                }
            )
    }
}

#Preview {
    CaptureReciptView(isActive: .constant(true))
}
