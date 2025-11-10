//
//  InfoViewHowToUse.swift
//  Pace of Mind
//
//  Created by Luana Gerber on 26/02/25.
//

import SwiftUI

struct InfoViewHowToUse: View {
    var body: some View {
        ZStack {
            Color("stressedColor")
                .ignoresSafeArea()
            
            VStack{
                Image("background_info_howto")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Color("stressedColor")
                    .ignoresSafeArea()
                Spacer()
            }
            
            VStack {
                HStack {
                    Text("info_howToUse_title")
                        .font(.custom("Delius", size: 22))
                        .multilineTextAlignment(.center)
                        .padding(.top, 60)
                        .padding(.bottom, 12)
                }
                
                VStack (alignment: .leading, spacing: 8){
                    Text("info_howToUse_title_1")
                        .fontWeight(.medium) +
                    Text("info_howToUse_text_1")
                        .font(.system(size: Constants.blockquoteFontSize, weight: .regular))
                    
                    Text("info_howToUse_title_2")
                        .fontWeight(.medium) +
                    Text("info_howToUse_text_2")
                        .font(.system(size: Constants.blockquoteFontSize, weight: .regular))
                    
                    Text("info_howToUse_title_3")
                        .fontWeight(.medium) +
                    Text("info_howToUse_text_3")
                        .font(.system(size: Constants.blockquoteFontSize, weight: .regular))
                }
                Spacer()

                Spacer(minLength: 40)
                
            }.padding(.horizontal, 31)
                .foregroundStyle(Constants.fontColor)
                .lineSpacing(1)
                .padding(.bottom, 60)
        }
        
    }
}


#Preview {
    InfoViewHowToUse()
}

#Preview {
    InfoView()
}
