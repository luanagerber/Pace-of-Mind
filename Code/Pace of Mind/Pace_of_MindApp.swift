//
//  Pace_of_MindApp.swift
//  Pace of Mind
//
//  Created by Luana Gerber on 22/02/25.
//

import SwiftUI

@main
struct PaceOfMind: App {
    
    @AppStorage("hasLaunchedBefore") private var hasLaunchedBefore = false
    
    init() {
        FontsManager.shared.registerFont(name: "Delius-Regular", withExtension: "ttf")
    }
    
    var body: some Scene {
        WindowGroup {
              
            if hasLaunchedBefore {
                HomeView()
            } else {
                WelcomeView()
            }
            
        }
        
    }
}
