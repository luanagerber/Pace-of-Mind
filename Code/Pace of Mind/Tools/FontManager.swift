//
//  FontManager.swift
//  Pace of Mind
//
//  Created by Luana Gerber on 26/01/25.
//

import Foundation
import SwiftUI

@MainActor
class FontsManager {
  
    static let shared = FontsManager()
    private init() {}
    
    func registerFont(name: String, withExtension: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: withExtension) else {
            print("Failed to find font resource: \(name).\(withExtension)")
            return
        }
        
        CTFontManagerRegisterFontsForURL(url as CFURL, CTFontManagerScope.process, nil)
    }
}

extension Font {
    static func customFont(size: CGFloat) -> Font {
        .custom("Delius", size: size)
    }
}
