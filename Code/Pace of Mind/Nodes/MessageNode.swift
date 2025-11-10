//
//  MessageNode.swift
//  Pace of Mind
//
//  Created by Luana Gerber on 07/02/25.
//


import SpriteKit

class MessageNode: SKNode {
    init(state: HomeModel) {
        super.init()
        
        let messageLine1 = SKLabelNode(text: state.messageLine1)
        messageLine1.fontName = "SF Pro Display"
        messageLine1.fontSize = Constants.textFontSize
        messageLine1.fontColor = .init(Constants.fontColor)
        messageLine1.position = .init(x: 0, y: -331)
        messageLine1.zPosition = 7
        addChild(messageLine1)
        
        let messageLine2 = SKLabelNode(text: state.messageLine2)
        messageLine2.fontName = "SF Pro Display"
        messageLine2.fontSize = Constants.textFontSize
        messageLine2.fontColor = .init(Constants.fontColor)
        messageLine2.position = .init(x: 0, y: -352)
        messageLine2.zPosition = 7
        addChild(messageLine2)
        
        let messageLine3 = SKLabelNode(text: state.messageLine3)
        messageLine3.fontName = "SF Pro Display"
        messageLine3.fontSize = Constants.textFontSize
        messageLine3.fontColor = .init(Constants.fontColor)
        messageLine3.position = .init(x: 0, y: -373)
        messageLine3.zPosition = 7
        addChild(messageLine3)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
