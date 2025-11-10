//
//  WelcomeView.swift
//  Pace of Mind
//
//  Created by Luana Gerber on 25/01/25.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                Color(.customWhite)
                    .ignoresSafeArea()
                
                VStack{
                    if isIPhoneProMax() {
                        Spacer()
                    }
                    Image("background_welcome")
                        .resizable()
                        .ignoresSafeArea()
                }
                
                
                VStack {
                    Spacer()
                    
                    WelcomeViewContent()
                    
                    HStack{
                        Spacer()
                        
                        NavigationLink(
                            destination: HomeView().onAppear {
                                UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
                            },
                            label: {
                                Image("arrow_forward")
                                    .frame(width: 14, height: 16)
                            }
                        )
                    }
                }
                .padding(16)
                
                
            }
        }
        
    }
    
    func isIPhoneProMax() -> Bool {
        let screenHeight = UIScreen.main.bounds.height
        return screenHeight >= 926
    }
}

#Preview {
    WelcomeView()
}
