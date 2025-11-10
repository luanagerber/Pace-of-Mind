//
//  WheelNode.swift
//  Pace of Mind
//
//  Created by Luana Gerber on 07/02/25.
//

import SpriteKit

class WheelBackgroundNode: SKNode {
    override init() {
        super.init()
        
        // BACKGROUND IMAGE
        let backgroundWheel = SKSpriteNode(imageNamed: "background_wheel")
        backgroundWheel.size = .init(width: 388, height: 338.72)
        backgroundWheel.position = .init(x: 0, y: 64)
        backgroundWheel.zPosition = 2
        addChild(backgroundWheel)
        
        
        // LABEL
        let seasonLabel = SKLabelNode(text: NSLocalizedString("home_season_label", comment: ""))
        seasonLabel.fontName = "SF Pro Display"
        seasonLabel.fontSize = Constants.labelFontSize
        seasonLabel.fontColor = .init(Constants.fontColor)
        seasonLabel.position = .init(x: 0, y: 215)
        seasonLabel.zPosition = 4
        addChild(seasonLabel)
        
        let cyclePhaseLabel = SKLabelNode(text: NSLocalizedString("home_cycle_phase_label", comment: ""))
        cyclePhaseLabel.fontName = "SF Pro Display"
        cyclePhaseLabel.fontSize = Constants.labelFontSize
        cyclePhaseLabel.fontColor = .init(Constants.fontColor)
        cyclePhaseLabel.position = .init(x: 0, y: 127)
        cyclePhaseLabel.zPosition = 4
        addChild(cyclePhaseLabel)
        
        let activitiesLabel = SKLabelNode(text: NSLocalizedString("home_activities_label", comment: ""))
        activitiesLabel.fontName = "SF Pro Display"
        activitiesLabel.fontSize = Constants.labelFontSize
        activitiesLabel.fontColor = .init(Constants.fontColor)
        activitiesLabel.position = .init(x: 0, y: 40.0)
        activitiesLabel.zPosition = 4
        addChild(activitiesLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
