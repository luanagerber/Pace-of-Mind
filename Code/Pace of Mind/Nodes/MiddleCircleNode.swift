//
//  MiddleCircleIconsNode.swift
//  Pace of Mind
//
//  Created by Luana Gerber on 07/02/25.
//

import SpriteKit
import UIKit

class MiddleCircleNode: SKNode {
    
    weak var homeScene: HomeScene?
    
    var lastPosition: CGPoint = .zero
    
    let iconAngles: [CGFloat] = [0, 15, 30, 45]
    var cyclePhaseID: Int = 0
    
    init(position: CGPoint = .zero, homeScene: HomeScene? = nil) {
        self.homeScene = homeScene
        
        super.init()
        
        let transparentCircle: SKShapeNode = .init(circleOfRadius: 510)
        transparentCircle.fillColor = .clear
        transparentCircle.strokeColor = .clear
        transparentCircle.lineWidth = 0
        transparentCircle.zPosition = 22
        addChild(transparentCircle)
        
        let follicularIcon: SKSpriteNode = .init(imageNamed: "follicular_x")
        follicularIcon.size = .init(width: 42.45, height: 40)
        follicularIcon.position = .init(x: 0, y: 470)
        follicularIcon.zPosition = 30
        addChild(follicularIcon)
        
        let ovulationIcon: SKSpriteNode = .init(imageNamed: "ovulation_x")
        ovulationIcon.size = .init(width: 42.45, height: 40)
        ovulationIcon.zRotation = -15 * .pi / 180
        ovulationIcon.position = .init(x: 122, y: 453.5)
        ovulationIcon.zPosition = 30
        addChild(ovulationIcon)

        let lutealIcon: SKSpriteNode = .init(imageNamed: "luteal_x")
        lutealIcon.size = .init(width: 42.45, height: 40)
        lutealIcon.zRotation = -30 * .pi / 180
        lutealIcon.position = .init(x: 234, y: 406.3)
        lutealIcon.zPosition = 30
        addChild(lutealIcon)
        
        let menstrualIcon: SKSpriteNode = .init(imageNamed: "menstrual_x")
        menstrualIcon.size = .init(width: 42.45, height: 40)
        menstrualIcon.zRotation = -45 * .pi / 180
        menstrualIcon.position = .init(x: 333, y: 332)
        menstrualIcon.zPosition = 30
        addChild(menstrualIcon)
        
        self.position = position
        isUserInteractionEnabled = true
        
        let initialAnimation = SKAction.rotate(toAngle: 15 * .pi / 180, duration: 0.65, shortestUnitArc: true)
        self.run(initialAnimation)
        
    }
    
    func getCyclePhaseID() -> Int {
        return cyclePhaseID
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        lastPosition = touch.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else { return }
        
        let location = touch.location(in: self)
        
        let movedX = location.x - lastPosition.x
        let movedY = location.y - lastPosition.y
        
        let distanceMoved = hypot(movedX, movedY)
        
        let signal: CGFloat = movedX >= 0 ? -1 : 1
        
        let damping = 0.8
        
        self.zRotation += ((distanceMoved)/510 * damping) * signal
        
        lastPosition = location
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let currentDegrees = self.zRotation * 180 / .pi
        
        
        if currentDegrees < 0 {
            let resetAction = SKAction.rotate(toAngle: 0, duration: 0.1, shortestUnitArc: true)
            
            self.triggerHapticFeedback()
            run(resetAction)
            return
        }
        
        
        let sign: CGFloat = currentDegrees < 0 ? -1 : 1
        
        let absDegrees = abs(currentDegrees)
        
        
        if absDegrees < 7.5 {
            let action = SKAction.rotate(toAngle: 0, duration: 0.1, shortestUnitArc: true)
            
            self.triggerHapticFeedback()
            run(action)
            return
        }
        
        
        var bestAngle: CGFloat = iconAngles.first ?? 0
        
        var minDiff = abs(absDegrees - bestAngle)
        
        for angle in iconAngles {
            
            let diff = abs(absDegrees - angle)
            if diff < minDiff {
                bestAngle = angle
                minDiff = diff
            }
        }
        
        let targetDegrees = bestAngle * sign
        let targetRadians = targetDegrees * .pi / 180
        
        cyclePhaseID = Int(targetDegrees)
        
        self.triggerHapticFeedback()
        run(.rotate(toAngle: targetRadians, duration: 0.1, shortestUnitArc: true)){
            self.homeScene?.updateEmotion()
        }
        
    }
    
    private func triggerHapticFeedback() {
        let selectionFeedback = UISelectionFeedbackGenerator()
        selectionFeedback.selectionChanged()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
