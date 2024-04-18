//
//  LoginView.swift
//  RampClone
//
//  Created by Sidney Sadel on 4/18/24.
//

import SwiftUI

struct LoginView: View {
    private var currentVersion: String? {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    private let authService: AuthService = ServiceContainer.shared.authService
    
    var body: some View {
        VStack {
            Spacer()
            logo
            Spacer()
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
            
            if let currentVersion = currentVersion {
                Text("Version \(currentVersion)")
                    .font(.caption)
                    .foregroundStyle(.black.opacity(0.5))
            }
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.sand.ignoresSafeArea())
    }
    
    private var logo: some View {
        Image(.logo)
            .resizable()
            .scaledToFit()
            .frame(width: UIScreen.main.bounds.width * 0.5)
    }
}

#Preview {
    LoginView()
}
