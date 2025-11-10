//
//  EnergyLevel.swift
//  Pace of Mind
//
//  Created by Luana Gerber on 03/02/25.
//

import SwiftUI

enum EnergyLevel: CaseIterable {
    case high
    case mediumHigh
    case mediumLow
    case low

    var minValue : Int {
        switch self {
        case .high: return 75
        case .mediumHigh: return 50
        case .mediumLow: return 26
        case .low: return 0
        }
    }
    
    var maxValue : Int {
        switch self {
        case .high: return 100
        case .mediumHigh: return 74
        case .mediumLow: return 49
        case .low: return 25
        }
    }
    
    static func getLevel(for value: Int) -> EnergyLevel {
        return Self.allCases.first { $0.minValue...$0.maxValue ~= value } ?? .low
    }
}
