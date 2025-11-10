//
//  CharacterNode.swift
//  Pace of Mind
//
//  Created by Luana Gerber on 07/02/25.
//

import SpriteKit

class CharacterNode: SKNode {
    init(state: HomeModel) {
        super.init()
        
        let character = SKSpriteNode(imageNamed: state.characterImage)
        character.size = .init(width: 164, height: 235)
        character.position = .init(x: 0, y: -180)
        character.zPosition = 4
        addChild(character)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
