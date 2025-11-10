//
//  InternalCircleIconsNode.swift
//  Pace of Mind
//
//  Created by Luana Gerber on 07/02/25.
//

import SpriteKit
import UIKit

class InternalCircleNode: SKNode {
    weak var homeScene: HomeScene?
    
    private var activitiesNumber: Int = 0
    private var activitiesNumberLabelNode: SKLabelNode!
    private var minusButtonNode: SKSpriteNode!
    private var plusButtonNode: SKSpriteNode!
    
    init(homeScene: HomeScene) {
        self.homeScene = homeScene
        super.init()
        
        let minusButton = SKSpriteNode(imageNamed: "button_minus")
        self.minusButtonNode = minusButton
        minusButton.position = .init(x: -97.5, y: -13.5)
        minusButton.zPosition = 30
        addChild(minusButton)
        
        let numberCircle = SKSpriteNode(imageNamed: "circle_x")
        numberCircle.position = .init(x: 0, y: -0.75)
        numberCircle.zPosition = 10
        addChild(numberCircle)
        
        let activitiesNumberLabel = SKLabelNode(text: "\(activitiesNumber)")
        activitiesNumberLabel.fontName = "Delius"
        activitiesNumberLabel.fontSize = 27
        activitiesNumberLabel.fontColor = .init(Constants.fontColor)
        activitiesNumberLabel.position = .init(x: 0, y: -10.75)
        activitiesNumberLabel.zPosition = 14
        addChild(activitiesNumberLabel)
        self.activitiesNumberLabelNode = activitiesNumberLabel
        
        let plusButton = SKSpriteNode(imageNamed: "button_plus")
        self.plusButtonNode = plusButton
        plusButton.position = .init(x: 97.5, y: -13.5)
        plusButton.zPosition = 30
        addChild(plusButton)
        
    }
    
    private func updateActivityLabel() {
        activitiesNumberLabelNode.text = "\(activitiesNumber)"
    }
    
    private func decreaseActivityNumber() {
        if activitiesNumber > 0 {
            activitiesNumber -= 1
            updateActivityLabel()
            self.homeScene?.updateEmotion()
        }
    }
    
    private func increaseActivityNumber() {
        if activitiesNumber < 9 {
            activitiesNumber += 1
            updateActivityLabel()
            self.homeScene?.updateEmotion()
        }
    }
    
    func getActivitiesNumber() -> Int {
        return activitiesNumber
    }
    
    private func triggerHapticFeedback() {
        let selectionFeedback = UISelectionFeedbackGenerator()
        selectionFeedback.selectionChanged()
    }
    
    func handleTouch(at location: CGPoint) {
        guard let minusButton = minusButtonNode, let plusButton = plusButtonNode else {
            print("Error: Buttons not initialized!")
            return
        }
        
        if minusButton.contains(location) {
            triggerHapticFeedback()
            decreaseActivityNumber()
        } else if plusButton.contains(location) {
            triggerHapticFeedback()
            increaseActivityNumber()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
