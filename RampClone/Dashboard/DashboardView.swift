//
//  DashboardView.swift
//  RampClone
//
//  Created by Sidney Sadel on 4/18/24.
//

import SwiftUI

struct DashboardView: View {
    @StateObject private var viewModel: DashboardViewModel = .init()
    
    var body: some View {
        VStack(spacing: 0) {
            header
            ScrollView {
                card
            }
            .applyFadeOutMask()
            .refreshable {
                await viewModel.fetch()
            }
        }
        .padding(.vertical)
        .background(Color.sand)
        .applySheetStyling()
    }
    
    private var header: some View {
        VStack(spacing: 10) {
            Text("Pull dow to capture recipts")
                .font(.caption2)
                .foregroundStyle(.black.opacity(0.175))
            HStack {
                Text("My Ramp")
                    .font(.title2.weight(.bold))
                Spacer()
                HStack(spacing: 15) {
                    Button {
                        print("placeholder")
                    } label: {
                        Image(systemName: "dollarsign.arrow.circlepath")
                            .imageScale(.large)
                    }
                    .buttonStyle(.plain)
                    
                    Button {
                        print("placeholder")
                    } label: {
                        Image(systemName: "gear")
                            .imageScale(.large)
                    }
                    .buttonStyle(.plain)
                }
                .foregroundStyle(.black.opacity(0.4))
            }
        }
        .padding(.horizontal)
    }
    
    private var card: some View {
        ZStack {
            if let card = viewModel.card {
                CardCell(card: card)
            } else {
                CardCell(card: .init(name: "placeholder", category: .travelAndEntertainment, amount: 0.0, monthlyLimit: 0.0))
                    .redacted(reason: .placeholder)
            }
        }
        .padding(.top, 25)
        .padding(.horizontal)
    }
}

#Preview {
    Color.black.ignoresSafeArea()
        .sheet(isPresented: .constant(true), content: {
            DashboardView()
        })
}
