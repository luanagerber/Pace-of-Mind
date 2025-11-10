//
//  TitleNode.swift
//  Pace of Mind
//
//  Created by Luana Gerber on 07/02/25.
//

import SpriteKit

class TitleNode: SKNode {
    init(state: HomeModel) {
        super.init()
        
        let titleLine1 = SKLabelNode(text: state.titleLine1)
        titleLine1.fontName = "Delius"
        titleLine1.fontSize = Constants.titleFontSize
        titleLine1.fontColor = .init(Constants.fontColor)
        titleLine1.position = .init(x: 0, y: 310)
        titleLine1.zPosition = 4
        addChild(titleLine1)
        
        let titleLine2 = SKLabelNode(text: state.titleLine2)
        titleLine2.fontName = "Delius"
        titleLine2.fontSize = Constants.titleFontSize
        titleLine2.fontColor = .init(Constants.fontColor)
        titleLine2.position = .init(x: 0, y: 264)
        titleLine2.zPosition = 4
        addChild(titleLine2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
