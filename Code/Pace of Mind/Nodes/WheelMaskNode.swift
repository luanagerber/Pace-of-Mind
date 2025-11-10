//
//  WheelMaskNode.swift
//  Pace of Mind
//
//  Created by Luana Gerber on 07/02/25.
//

import SpriteKit

class WheelMaskNode: SKNode {
    
    var maskNode = SKSpriteNode()
    
    override init() {
        super.init()
        
        let blockSquare = SKShapeNode(rectOf: CGSize(width: 400, height: 400))
        blockSquare.fillColor = .clear
        blockSquare.strokeColor = .clear
        blockSquare.position = .init(x: 0, y: 420)
        blockSquare.zPosition = 25
        addChild(blockSquare)
        
        let blockCircle = SKShapeNode(circleOfRadius: 408)
        blockCircle.fillColor = .clear
        blockCircle.strokeColor = .clear
        blockCircle.position = .init(x: 0, y: -363)
        blockCircle.zPosition = 25
        addChild(blockCircle)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
