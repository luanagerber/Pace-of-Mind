//
//  EmotionCalculator.swift
//  Pace of Mind
//
//  Created by Luana Gerber on 14/02/25.
//

import SwiftUI
import UIKit

@MainActor
struct EmotionCalculator {
    
    static let seasonsModel : [Season] = [
        Season.init(id: 0, name: "Spring", points: 38),
        Season.init(id: 15, name: "Summer", points: 50),
        Season.init(id: 30, name: "Autumn", points: 25),
        Season.init(id: 45, name: "Winter", points: 13)
    ]
    
    static let cycleModel : [CyclePhase] = [
        CyclePhase.init(id: 0, name: "Follicular", points: 38),
        CyclePhase.init(id: 15, name: "Ovulation", points: 50),
        CyclePhase.init(id: 30, name: "Luteal", points: 0),
        CyclePhase.init(id: 45, name: "Menstrual", points: 25)
    ]
    
    static func calculateEmotion(externalCircle: ExternalCircleNode, middleCircle: MiddleCircleNode, internalCircle: InternalCircleNode) -> Emotion {
        
        let seasonID = externalCircle.getSeasonID()
        let cyclePhaseID = middleCircle.getCyclePhaseID()
        let activitiesNumber = internalCircle.getActivitiesNumber()
        
        let seasonPoints = seasonsModel.first(where: { $0.id == seasonID })?.points ?? 0
        let cyclePhasePoints = cycleModel.first(where: { $0.id == cyclePhaseID})?.points ?? 0
        let totalEnergy = seasonPoints + cyclePhasePoints
        
        let energyLevel = EnergyLevel.getLevel(for: totalEnergy)
        
        let finalEmotion = Emotion.calculate(energyLevel: energyLevel, activities: activitiesNumber)
        
        if finalEmotion == .stressed {triggerHapticFeedback()}
        return finalEmotion
        
    }
    
    static func triggerHapticFeedback() {
        let impactGenerator = UIImpactFeedbackGenerator(style: .heavy)
        impactGenerator.impactOccurred()
    }
}
