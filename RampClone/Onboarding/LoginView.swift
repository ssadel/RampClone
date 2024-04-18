//
//  LoginView.swift
//  RampClone
//
//  Created by Sidney Sadel on 4/18/24.
//

import SwiftUI

struct LoginView: View {
    @State private var logoShouldAppear: Bool = false
    private var currentVersion: String? {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    private let authService: AuthService = ServiceContainer.shared.authService
    
    var body: some View {
        VStack {
            Spacer()
            logo
            Spacer()
            loginButton
            
            currentVersionLabel
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.sand.ignoresSafeArea())
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                logoShouldAppear = true
            }
        }
    }
    
    @ViewBuilder
    private var logo: some View {
        let imageDimension: CGFloat = UIScreen.main.bounds.width * 0.5
        let rotationDegrees: CGFloat = logoShouldAppear ? 0 : -50
        let rectangleOffset: CGFloat = logoShouldAppear ? imageDimension/2.5 : -10
        let opacity: CGFloat = logoShouldAppear ? 1 : 0
        
        ZStack {
            Image(.logo)
                .resizable()
                .scaledToFit()
                .opacity(opacity)
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color.sand)
                    .offset(y: -rectangleOffset)
                    .frame(height: imageDimension)
                Rectangle()
                    .fill(Color.sand)
                    .offset(y: rectangleOffset)
                    .frame(height: imageDimension)
            }
        }
        .frame(width: imageDimension)
        .rotationEffect(.degrees(rotationDegrees), anchor: .center)
        .animation(.easeOut(duration: 1), value: logoShouldAppear)
    }
    
    private var loginButton: some View {
        Button {
            Task {
                try await authService.simulateSignIn()
            }
        } label: {
            Text("Log in to Ramp")
                .font(.title2.weight(.bold))
                .foregroundStyle(Color.sand)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(.black)
                )
                .padding()
        }
        .buttonStyle(.interactive(scale: 1.025))
    }
    
    @ViewBuilder
    private var currentVersionLabel: some View {
        if let currentVersion = currentVersion {
            Text("Version \(currentVersion)")
                .font(.caption)
                .foregroundStyle(.black.opacity(0.5))
        }
    }
}

#Preview {
    LoginView()
}
