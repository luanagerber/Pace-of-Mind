//
//  HomeScene.swift
//  Pace of Mind
//
//  Created by Luana Gerber on 24/01/25.
//

import SpriteKit

class HomeScene: SKScene {
    
    private var activeState: HomeModel = .start
    
    private var externalCircleNode: ExternalCircleNode?
    private var middleCircleNode: MiddleCircleNode?
    private var internalCircleNode: InternalCircleNode?
    
    private var minusButtonNode: SKSpriteNode?
    private var plusButtonNode: SKSpriteNode?
    
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        self.anchorPoint = .init(x: 0.5, y: 0.5)
        
        // BACKGROUND
        addChild(BackgroundNode(state: activeState))
        
        // HEADER SECTION
        addChild(TitleNode(state: activeState))
        
        // WHEEL SECTION
        let externalCircleIcons: ExternalCircleNode = .init(position: .init(x: 0, y: -378.5), homeScene: self)
        let middleCircleIcons: MiddleCircleNode = .init(position: .init(x: 0, y: -378.5), homeScene: self)
        
        
        let internalCircleIcons = InternalCircleNode(homeScene: self)
        
        self.externalCircleNode = externalCircleIcons
        self.middleCircleNode = middleCircleIcons
        self.internalCircleNode = internalCircleIcons
        
        addChild(WheelBackgroundNode())
        addChild(externalCircleIcons)
        addChild(middleCircleIcons)
        addChild(internalCircleIcons)
        addChild(WheelMaskNode())
        
        //  FOOTER SECTION
        addChild(CharacterNode(state: activeState))
        addChild(MessageNode(state: activeState))
        
    }
    
    // UPDATE FUNCTIONS
    func updateEmotion() {
        guard let externalCircleNode = externalCircleNode else { return }
        guard let middleCircleNode = middleCircleNode else { return }
        guard let internalCircleNode = internalCircleNode else { return }
        
        let emotion = EmotionCalculator.calculateEmotion(
            externalCircle: externalCircleNode,
            middleCircle: middleCircleNode,
            internalCircle: internalCircleNode
        )
        
        // Update UI
        updateUI(emotion)
    }
    
    func updateUI(_ emotion: Emotion) {
        
        let newState: HomeModel
        switch emotion {
        case .bored: newState = .bored
        case .calm: newState = .calm
        case .happy: newState = .happy
        case .stressed: newState = .stressed
        }
        
        guard newState != activeState else { return }
        
        activeState = newState
        
        children.forEach { node in
            if node is BackgroundNode ||
                node is TitleNode ||
                node is CharacterNode ||
                node is MessageNode {
                node.removeFromParent()
            }
        }
        
        addChild(BackgroundNode(state: activeState))
        addChild(TitleNode(state: activeState))
        addChild(CharacterNode(state: activeState))
        addChild(MessageNode(state: activeState))
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        if let internalIcons = internalCircleNode {
            let localLocation = touch.location(in: internalIcons)
            internalIcons.handleTouch(at: localLocation)
        }
    }
    
}
