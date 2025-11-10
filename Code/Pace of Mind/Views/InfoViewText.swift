//
//  InfoViewContent.swift
//  Pace of Mind
//
//  Created by Luana Gerber on 19/02/25.
//

import SwiftUI

struct InfoViewText: View {
    var body: some View {
        
            VStack(spacing: 22) {
              
                Text("info_text_pace_of_mind")
                    .font(.system(size: Constants.textFontSize, weight: .semibold)) +
                Text("info_text_about_1")
                    .font(.system(size: Constants.textFontSize, weight: .regular))
                
            }.padding(.horizontal, 31)
            .padding(.top, 14)
                .foregroundStyle(Constants.fontColor)
                .multilineTextAlignment(.leading)
                .lineSpacing(1)
        
    }
}

#Preview {
    InfoView()
}
