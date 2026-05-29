//
//  DroneVisionViewModel.swift
//  TargetDemo
//
//  Created by Didier Delhaisse on 29/05/2026.
//

import SwiftUI

@Observable
class DroneVisionViewModel {
    var lockState: LockState = .searching
    var confidence: Double = 0.0
    
    func simulateDetection () {
        withAnimation(.easeInOut(duration: 0.5)) {
            confidence = Double.random(in: 0.3...1.0)
            
            if confidence > 0.75 {
                lockState = .locked
            } else if confidence > 0.45 {
                lockState = .detected
            } else {
                lockState = .searching
            }
        }
    }
}
