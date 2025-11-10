//
//  HomeView.swift
//  Pace of Mind
//
//  Created by Luana Gerber on 24/01/25.
//

import SwiftUI
import _SpriteKit_SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                SpriteView(scene: HomeScene(size: CGSize(width: 390, height: 844)))
                    .ignoresSafeArea()
                
                HomeViewInfoButton()
            }.navigationBarBackButtonHidden(true)
        }

    }
}

#Preview {
    HomeView()
}
