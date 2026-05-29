//
//  LockState.swift
//  TargetDemo
//
//  Created by Didier Delhaisse on 29/05/2026.
//

import SwiftUI

enum LockState: String {
    case searching = "Searching"
    case detected = "Detected"
    case locked = "Locked"
    
    var color: Color {
        switch self {
        case .searching: return .gray
        case .detected: return .yellow
        case .locked: return .green
        }
    }
}
