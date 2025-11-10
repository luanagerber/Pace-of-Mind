//
//  BackgroundNode.swift
//  Pace of Mind
//
//  Created by Luana Gerber on 07/02/25.
//


import SpriteKit

class BackgroundNode: SKNode {
    init(state: HomeModel) {
        super.init()
        
        let backgroundColor = SKSpriteNode(color: .init(Constants.backgroundColor), size: .init(width: 500, height: 1000))
        backgroundColor.position = .init(x: 0, y: 0)
        backgroundColor.zPosition = -10
        addChild(backgroundColor)
        
        let emotionWave = SKSpriteNode(imageNamed: state.waveImage)
        emotionWave.size = .init(width: 370, height: 890.33)
        emotionWave.position = .init(x: 0, y: 35)
        emotionWave.zPosition = -7
        addChild(emotionWave)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
