//
//  WelcomeViewContent.swift
//  Pace of Mind
//
//  Created by Luana Gerber on 19/02/25.
//

import SwiftUI

struct WelcomeViewContent: View {
    var body: some View {
        
        Image("img_welcome")
            .padding(.bottom, 2)
        
        Text("welcome_title")
            .font(.custom("Delius", size: Constants.coverTitleFontSize))
            .foregroundStyle(Constants.fontColor)
            .multilineTextAlignment(.center)
            .padding(.bottom, 10)
        
        
        Text("welcome_text")
            .font(.system(size: Constants.subtitleFontSize, weight: .regular))
            .foregroundStyle(Constants.fontColor)
            .multilineTextAlignment(.center)
            .padding(.bottom, 35)
    }
}

#Preview {
    WelcomeView()
}

#Preview {
    WelcomeViewContent()
}
