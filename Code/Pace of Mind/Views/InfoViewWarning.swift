//
//  InfoViewWarning.swift
//  Pace of Mind
//
//  Created by Luana Gerber on 19/02/25.
//

import SwiftUI

struct InfoViewWarning: View {
    var body: some View {
        ZStack {
            Image("background_info_warning")
                .resizable()
            
            VStack {
                HStack{
                    Text("info_warning_title")
                        .font(.custom("Delius", size: 22))
                        .foregroundStyle(Constants.fontColor)
                        .multilineTextAlignment(.center)
                        .lineSpacing(1)
                        .padding(.bottom, 12)
                }
                
                Text("info_warning_text")
                    .foregroundStyle(Constants.fontColor)
                    .font(.system(size: Constants.blockquoteFontSize, weight: .regular))
                
            }.padding(.horizontal, 31)
                .padding(.top, 5)
                .padding(.bottom, 0)
                .foregroundStyle(Constants.fontColor)
                .multilineTextAlignment(.leading)
                .lineSpacing(1)
        }
        
    }
}


#Preview {
    InfoViewWarning()
}

#Preview {
    InfoView()
}
