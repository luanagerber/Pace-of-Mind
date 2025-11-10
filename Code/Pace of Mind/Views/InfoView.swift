//
//  SwiftUIView.swift
//  Pace of Mind
//
//  Created by Luana Gerber on 25/01/25.
//

import SwiftUI

struct InfoView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        ZStack {
            
            Constants.backgroundColor
                .ignoresSafeArea()
            
            
            VStack {
                
                ZStack {
                    HStack {
                        Button(action: {
                            dismiss()
                        }) {
                            Image("arrow_back")
                                .frame(width: 14, height: 16)
                        }
                        .buttonStyle(.plain)
                        .padding(.top, 55)
                        .padding(.horizontal, 16)
                        
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("info_title")    .font(.custom("Delius", size: 36))
                            .foregroundStyle(Constants.fontColor)
                            .multilineTextAlignment(.center)
                            .padding(.top, 56)
                            .padding(.horizontal, 16)
                        
                    }
                }.padding(.bottom, 8)
                
                ScrollView {
                    InfoViewText()
                        .padding(.bottom, 40)
                    
                    InfoViewHowToUse()
                    
                    InfoViewSymbols()
                        .padding(.top, -60)
                    
                    InfoViewWarning()
                        .padding(.top, -72)
                }.padding(.bottom, 10)
                
            }.ignoresSafeArea()
            
            
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    InfoView()
}
