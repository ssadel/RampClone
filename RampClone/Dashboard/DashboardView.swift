//
//  DashboardView.swift
//  RampClone
//
//  Created by Sidney Sadel on 4/18/24.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        VStack(spacing: 0) {
            header
            ScrollView {
                Text("yo")
            }
            .applyFadeOutMask()
        }
        .padding(.horizontal)
        .padding(.vertical)
        .background(Color.sand)
        .presentationDragIndicator(.visible)
    }
    
    private var header: some View {
        VStack(spacing: 10) {
            Text("Pull dow to capture recipts")
                .font(.caption2)
                .foregroundStyle(.black.opacity(0.175))
            HStack {
                Text("My Ramp")
                    .font(.title.weight(.bold))
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
    }
}

#Preview {
    Text("")
        .sheet(isPresented: .constant(true), content: {
            DashboardView()
        })
}
