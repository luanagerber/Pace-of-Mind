//
//  HomeViewInfoButton.swift
//  Pace of Mind
//
//  Created by Luana Gerber on 04/02/25.
//

import SwiftUI

struct HomeViewInfoButton: View {

    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                NavigationLink(destination: InfoView()) {
                    Image("button_info")
                }
                .padding(.horizontal, 16)
                .padding(.top, 7)
            }
            Spacer()
        }
    }
    
}
