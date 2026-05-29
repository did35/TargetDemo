//
//  DroneVisionView.swift
//  TargetDemo
//
//  Created by Didier Delhaisse on 29/05/2026.
//

import SwiftUI

struct DroneVisionView: View {
    @State private var vm = DroneVisionViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.black, .gray.opacity(0.5)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            // Fake tree / target
            Image(systemName: "tree.fill")
                .font(.system(size: 120))
                .foregroundStyle(.green.opacity(0.60))
            
        }
    }
}

#Preview {
    DroneVisionView()
}
