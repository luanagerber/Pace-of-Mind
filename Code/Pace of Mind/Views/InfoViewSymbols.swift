//
//  InfoViewSymbols.swift
//  Pace of Mind
//
//  Created by Luana Gerber on 19/02/25.
//

import SwiftUI

struct InfoViewSymbols: View {
    var body: some View {
        ZStack {
            Image("background_info_symbols")
                .resizable()
            
            VStack {
                HStack {
                    Text("info_symbols_title")
                        .font(.custom("Delius", size: 22))
                        .foregroundStyle(Constants.fontColor)
                        .multilineTextAlignment(.center)
                        .lineSpacing(1)
                        .padding(.top, 0)
                        .padding(.bottom, 12)
                }
                
                HStack {
                    VStack {
                        
                        HStack {
                            Text("info_symbols_season")
                                .font(.system(size: Constants.textFontSize, weight: .medium))
                            Spacer()
                        }
                        HStack {
                            Image("spring_selected")
                                .resizable()
                                .frame(width: 22, height: 22)
                            Text("info_symbols_spring")
                            Spacer()
                        }
                        HStack {
                            Image("summer_selected")
                                .resizable()
                                .frame(width: 22, height: 22)
                            Text("info_symbols_summer")
                            Spacer()
                        }
                        HStack {
                            Image("autumn_selected")
                                .resizable()
                                .frame(width: 22, height: 22)
                            Text("info_symbols_autumn")
                            Spacer()
                        }
                        HStack {
                            Image("winter_selected")
                                .resizable()
                                .frame(width: 22, height: 22)
                            Text("info_symbols_winter")
                            Spacer()
                        }
                    }.frame(maxWidth: isIPhoneProMax() ? 160 : 130)
                    
                    VStack {
                        HStack {
                            Text("info_symbols_cycle_phase")
                                .font(.system(size: Constants.textFontSize, weight: .medium))
                            Spacer()
                        }
                        HStack {
                            Image("menstrual_x")
                                .resizable()
                                .frame(width: 22, height: 22)
                            Text("info_symbols_menstrual")
                            Spacer()
                        }
                        HStack {
                            Image("follicular_x")
                                .resizable()
                                .frame(width: 22, height: 22)
                            Text("info_symbols_follicular")
                            Spacer()
                        }
                        HStack {
                            Image("ovulation_x")
                                .resizable()
                                .frame(width: 22, height: 22)
                            Text("info_symbols_ovulation")
                            Spacer()
                        }
                        HStack {
                            Image("luteal_x")
                                .resizable()
                                .frame(width: 22, height: 22)
                            Text("info_symbols_luteal")
                            Spacer()
                        }
                    }
                }.font(.system(size: Constants.textFontSize, weight: .regular))
                
            }.padding(.horizontal, 31)
                .padding(.bottom, 55)
                .foregroundStyle(Constants.fontColor)
                .multilineTextAlignment(.leading)
                .lineSpacing(1)
        }
        
    }
    
    func isIPhoneProMax() -> Bool {
        let screenHeight = UIScreen.main.bounds.height
        return screenHeight >= 926
    }
    
}

#Preview {
    InfoViewSymbols()
}

#Preview {
    InfoView()
}
