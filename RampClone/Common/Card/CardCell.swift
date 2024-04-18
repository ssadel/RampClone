//
//  CardCell.swift
//  RampClone
//
//  Created by Sidney Sadel on 4/18/24.
//

import SwiftUI

struct CardCell: View {
    var card: Card
    private let aspectRatio: CGFloat = 1.586
    private var shape: RoundedRectangle {
        RoundedRectangle(cornerRadius: 12, style: .continuous)
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading) {
                top
                Spacer()
                bottom(geo)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .aspectRatio(aspectRatio, contentMode: .fit)
        .clipShape(shape)
        .background(background)
        .overlay(border)
    }
    
    private var top: some View {
        HStack {
            Text("\(card.name)'s Card")
                .font(.title3.weight(.medium))
            Image(systemName: "arrow.right")
                .font(.caption2.weight(.semibold))
        }
        .foregroundStyle(.black.opacity(0.3))
        .padding()
    }
    
    private func bottom(_ geo: GeometryProxy) -> some View {
        let height: CGFloat = geo.size.height / 2.75
        let hPadding: CGFloat = geo.size.width / 30
        let vPadding: CGFloat = geo.size.height / 30
        
        return VStack {
            HStack {
                Image(systemName: "link.circle.fill")
                    .imageScale(.large)
                Text(card.category.rawValue)
                    .font(.caption.weight(.medium))
            }
            .foregroundStyle(Color.softBlue)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            ProgressView(value: card.amount, total: card.monthlyLimit)
                .progressViewStyle(.linear)
                .tint(Color.softBlue)
                .frame(maxHeight: .infinity)
            
            HStack {
                Text("$\(card.amount.formatted())")
                Spacer()
                Text("$\(card.monthlyLimit.formatted()) / Month")
                    .foregroundStyle(.black.opacity(0.5))
            }
            .font(.headline.weight(.regular))
        }
        .padding(.horizontal, hPadding)
        .padding(.vertical, vPadding)
        .frame(height: height)
        .background(
            LinearGradient(colors: [Color.black.opacity(0.1), .white, .gray.opacity(0.1)], 
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
        )
        .overlay(Divider().opacity(0.5), alignment: .top)
    }
    
    private var background: some View {
        shape
            .fill(.white)
            .shadow(color: .shadowColor, radius: 8, y: 8)
    }
    
    private var border: some View {
        shape
            .stroke(lineWidth: 0.75)
            .foregroundStyle(Color.softBlue)
    }
}

#Preview {
    CardCell(card: .init(name: "Sid", category: .travelAndEntertainment, amount: 900.23, monthlyLimit: 2500))
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.sand.ignoresSafeArea())
}
