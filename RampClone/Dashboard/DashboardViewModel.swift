//
//  DashboardViewModel.swift
//  RampClone
//
//  Created by Sidney Sadel on 4/18/24.
//

import Foundation

final class DashboardViewModel: ObservableObject {
    @Published private(set) var card: Card?
    
    private let cardService: CardService = ServiceContainer.shared.cardService
    private let cancelBag: CancelBag = .init()
    
    init() {
        print("DashboardViewModel init")
        
        setupObservers()
        Task { [weak self] in
            await self?.fetch()
        }
    }
    
    deinit {
        print("DashboardViewModel deinit")
    }
    
    func fetch() async {
        do {
            try await cardService.fetchCard()
        } catch {
            print("fetch error: \(error)")
        }
    }
    
    private func setupObservers() {
        cardService.$card
            .receive(on: DispatchQueue.main)
            .sink { [weak self] card in
                self?.card = card
            }
            .store(in: cancelBag)
    }
}
