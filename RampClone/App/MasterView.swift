//
//  ContentView.swift
//  RampClone
//
//  Created by Sidney Sadel on 4/18/24.
//

import SwiftUI

struct MasterView: View {
    @StateObject private var viewModel: MasterViewModel = .init()
    
    var body: some View {
        let showLoadingView: Bool = viewModel.authState == .loading
        let showLoginView: Bool = viewModel.authState == .notAuthenticated
        
        ZStack {
            if showLoadingView {
                ProgressView()
            } else if showLoginView {
                LoginView()
            } else {
                CaptureReciptView(isActive: .init(
                    get: {
                        !viewModel.showDashboardViewSheet
                    }, set: {
                        viewModel.showDashboardViewSheet = !$0
                    }
                ))
                .sheet(isPresented: $viewModel.showDashboardViewSheet) {
                    DashboardView()
                }
                .onAppear {
                    viewModel.showDashboardViewSheet = true
                }
                .onDisappear {
                    viewModel.showDashboardViewSheet = false
                }
            }
        }
        .animation(.easeInOut, value: viewModel.authState)
    }
}

final class MasterViewModel: ObservableObject {
    @Published var showDashboardViewSheet: Bool = false
    @Published private(set) var authState: AuthService.State
    
    private let authService: AuthService = ServiceContainer.shared.authService
    private let cancelBag: CancelBag = .init()
    
    init() {
        print("MasterViewModel init")
        
        self.authState = authService.authState
        self.setupObservers()
    }
    
    deinit {
        print("MasterViewModel deinit")
        cancelBag.cancel()
    }
    
    private func setupObservers() {
        authService.$authState
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                // Prevent unecessary redraws
                guard self?.authState != state else { return }
                self?.authState = state
            }
            .store(in: cancelBag)
    }
}

#Preview {
    MasterView()
}
