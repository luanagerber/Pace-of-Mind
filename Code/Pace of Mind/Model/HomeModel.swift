//
//  EmotionsModel.swift
//  Pace of Mind
//
//  Created by Luana Gerber on 25/01/25.
//

import SwiftUI

enum HomeModel: String, CaseIterable {
    case start
    case bored
    case calm
    case happy
    case stressed
    
    var emotionName: String { self.rawValue }
    
    var titleLine1: String {
        switch self {
        case .bored, .calm, .happy, .stressed:
            return NSLocalizedString("home_emotions_title", comment: "")
        default:
            return NSLocalizedString("home_start_title_1", comment: "")
        }
    }
    
    var titleLine2: String {
        switch self {
        case .bored:
            return NSLocalizedString("home_bored_title", comment: "")
        case .calm:
            return NSLocalizedString("home_calm_title", comment: "")
        case .happy:
            return NSLocalizedString("home_happy_title", comment: "")
        case .stressed:
            return NSLocalizedString("home_stressed_title", comment: "")
        default:
            return NSLocalizedString("home_start_title_2", comment: "")
        }
    }
    
    var waveImage: String {
        "wave_\(emotionName.lowercased())"
    }
    
    var characterImage: String {
        "character_\(emotionName.lowercased())"
    }
    
    var messageLine1: String {
        switch self {
        case .bored:
            return NSLocalizedString("home_bored_message_1", comment: "")
        case .calm:
            return NSLocalizedString("home_calm_message_1", comment: "")
        case .happy:
            return NSLocalizedString("home_happy_message_1", comment: "")
        case .stressed:
            return NSLocalizedString("home_stressed_message_1", comment: "")
        default:
            return NSLocalizedString("home_start_message_1", comment: "")
        }
    }
    
    var messageLine2: String {
        switch self {
        case .bored:
            return NSLocalizedString("home_bored_message_2", comment: "")
        case .calm:
            return NSLocalizedString("home_calm_message_2", comment: "")
        case .happy:
            return NSLocalizedString("home_happy_message_2", comment: "")
        case .stressed:
            return NSLocalizedString("home_stressed_message_2", comment: "")
        default:
            return NSLocalizedString("home_start_message_2", comment: "")
        }
    }
    
    var messageLine3: String {
        switch self {
        case .bored:
            return NSLocalizedString("home_bored_message_3", comment: "")
        case .calm:
            return NSLocalizedString("home_calm_message_3", comment: "")
        case .happy:
            return NSLocalizedString("home_happy_message_3", comment: "")
        case .stressed:
            return NSLocalizedString("home_stressed_message_3", comment: "")
        default:
            return NSLocalizedString("home_start_message_3", comment: "")
        }
    }

    
}
