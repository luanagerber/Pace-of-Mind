//
//  ExternalCircleIconsNode.swift
//  Pace of Mind
//
//  Created by Luana Gerber on 07/02/25.
//

import SpriteKit
import UIKit

class ExternalCircleNode: SKNode {
    
    weak var homeScene: HomeScene?
    
    var lastPosition: CGPoint = .zero
    
    let iconAngles: [CGFloat] = [0, 15, 30, 45]
    var seasonID: Int = 0
    
    init(position: CGPoint = .zero, homeScene: HomeScene? = nil) {
        self.homeScene = homeScene
        
        super.init()
        
        let transparentCircle: SKShapeNode = .init(circleOfRadius: 600)
        transparentCircle.fillColor = .clear
        transparentCircle.strokeColor = .clear
        transparentCircle.lineWidth = 0
        transparentCircle.zPosition = 20
        addChild(transparentCircle)
        
        let springIcon: SKSpriteNode = .init(imageNamed: "spring_y")
        springIcon.size = .init(width: 142.18, height: 40)
        springIcon.position = .init(x: 0, y: 556.8)
        springIcon.zPosition = 30
        addChild(springIcon)

        let summerIcon: SKSpriteNode = .init(imageNamed: "summer_y")
        summerIcon.size = .init(width: 142.18, height: 40)
        summerIcon.zRotation = -15 * .pi / 180
        summerIcon.position = .init(x: 143.8, y: 537.8)
        summerIcon.zPosition = 30
        addChild(summerIcon)

        let autumnIcon: SKSpriteNode = .init(imageNamed: "autumn_y")
        autumnIcon.size = .init(width: 142.18, height: 40)
        autumnIcon.zRotation = -30 * .pi / 180
        autumnIcon.position = .init(x: 278.7, y: 482.5)
        autumnIcon.zPosition = 30
        addChild(autumnIcon)

        let winterIcon: SKSpriteNode = .init(imageNamed: "winter_y")
        winterIcon.size = .init(width: 142.18, height: 40)
        winterIcon.zRotation = -45 * .pi / 180
        winterIcon.position = .init(x: 393.5, y: 392.6)
        winterIcon.zPosition = 30
        addChild(winterIcon)
        
        let blankRectangle: SKShapeNode = .init(rectOf: CGSize(width: 142.18, height: 60))
        blankRectangle.fillColor = .clear
        blankRectangle.strokeColor = .clear
        blankRectangle.lineWidth = 1
        blankRectangle.zRotation = -60 * .pi / 180
        blankRectangle.position = .init(x: 480, y: 280)
        blankRectangle.zPosition = 30
        addChild(blankRectangle)
        

        self.position = position
        isUserInteractionEnabled = true
        
        // initial Animation
        let initialAnimation = SKAction.rotate(toAngle: 15 * .pi / 180, duration: 0.55, shortestUnitArc: true)
        self.run(initialAnimation)
        
    }
    
    func getSeasonID() -> Int {
        return seasonID
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
        
        //Total distance moved
        let distanceMoved = hypot(movedX, movedY)
        
        //Detect whether it turned left or right
        let signal: CGFloat = movedX >= 0 ? -1 : 1
        
        //Damping
        let damping = 0.8
        
        //Rotate when dragging
        self.zRotation += ((distanceMoved)/600 * damping) * signal
        
        //Saves last position
        lastPosition = location
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //Check the distance traveled
        let currentDegrees = self.zRotation * 180 / .pi
        //Returns 0 if the angle is negative.
        if currentDegrees < 0 {
            let resetAction = SKAction.rotate(toAngle: 0, duration: 0.1, shortestUnitArc: true)
            
            self.triggerHapticFeedback()
            run(resetAction)
            return
        }
        
        //Check whether it went left -1 or right 1
        let sign: CGFloat = currentDegrees < 0 ? -1 : 1
        
        //Take the angle at its absolute value
        let absDegrees = abs(currentDegrees)
        
        //Return to 0 if the movement is small
        if absDegrees < 7.5 {
            let action = SKAction.rotate(toAngle: 0, duration: 0.2, shortestUnitArc: true)
            
            self.triggerHapticFeedback()
            run(action)
            return
        }
        
        //Defines the best angle for rotation as 0.
        var bestAngle: CGFloat = iconAngles.first ?? 0
        
        //take the smallest difference between the angle it is at and the angles we have set as possible
        var minDiff = abs(absDegrees - bestAngle)
        
        //Find out what is the best angle
        for angle in iconAngles {
            
            //We look at each angle to see which one has the smallest difference compared to how much the user rotated it, and that will be the best angle.
            let diff = abs(absDegrees - angle)
            if diff < minDiff {
                bestAngle = angle
                minDiff = diff
            }
        }
        
        //Convert to radians
        let targetDegrees = bestAngle * sign
        let targetRadians = targetDegrees * .pi / 180
        
        seasonID = Int(targetDegrees)
        
        self.triggerHapticFeedback()

        //Rotate
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
