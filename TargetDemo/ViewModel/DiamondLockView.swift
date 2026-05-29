//
//  DiamondLockView.swift
//  TargetDemo
//
//  Created by Didier Delhaisse on 29/05/2026.
//

import SwiftUI

struct DiamondLockView: View {
    let color: Color
    
    var body: some View {
        GeometryReader { geo in
            let w = geo.size.width
            let h = geo.size.height
            
            Path { path in
                path.move(to: CGPoint(x: w / 2, y: 0))
                path.addLine(to: CGPoint(x: w, y: h / 2))
                path.addLine(to: CGPoint(x: w / 2, y: h))
                path.addLine(to: CGPoint(x: 0, y: h / 2))
                path.closeSubpath()
            }
            .stroke(color, lineWidth: 4)
            .shadow(color: color, radius: 10)
            .overlay {
                Circle()
                    .fill(color)
                    .frame(width: 8, height: 8)
            }
        }
    }
}

#Preview {
    DiamondLockView(color: .blue)
}
