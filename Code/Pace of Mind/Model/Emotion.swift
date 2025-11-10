//
//  Emotion.swift
//  Pace of Mind
//
//  Created by Luana Gerber on 14/02/25.
//

import SwiftUI

enum Emotion {
    case bored
    case calm
    case happy
    case stressed
    
    static func calculate(energyLevel: EnergyLevel, activities: Int) -> Emotion {
        switch energyLevel {
        case .high:
            switch activities {
            case 0...1: return .bored
            case 2...4: return .calm
            case 5...7: return .happy
            default: return .stressed
            }
            
        case .mediumHigh:
            switch activities {
            case 0...1: return .bored
            case 2...3: return .calm
            case 4...5: return .happy
            default: return .stressed
            }
            
        case .mediumLow:
            switch activities {
            case 0: return .bored
            case 1...2: return .calm
            case 3...4: return .happy
            default: return .stressed
            }
            
        case .low:
            switch activities {
            case 0: return .bored
            case 1: return .calm
            case 2...3: return .happy
            default: return .stressed
            }
        }
    }
}
