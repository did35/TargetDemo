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
                .font(.system(size: 80))
                .foregroundStyle(.green.opacity(0.60))
            
            if vm.lockState == .locked {
                DiamondLockView(color: .green)
                    .frame(width: 180, height: 180)
            } else if vm.lockState == .detected {
                DiamondLockView(color: .yellow)
                    .frame(width: 160, height: 160)
            }
            
            VStack {
                Spacer()
                GlassCard {
                    VStack(spacing: 12) {
                        Text(vm.lockState.rawValue)
                            .font(.title2.bold())
                            .foregroundStyle(.secondary)
                        
                        Text("Confidence: \(Int(vm.confidence * 100))%")
                            .foregroundStyle(.white)
                        
                        Button("Simulate Detection") {
                            vm.simulateDetection()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    DroneVisionView()
}
