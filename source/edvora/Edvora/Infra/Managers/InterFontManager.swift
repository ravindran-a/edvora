//
//  InterFontManager.swift
//  Edvora
//
//  Created by Ravindran on 16/12/21.
//

import Foundation
import SwiftUI

class InterFontManager {

    enum InterFonts: String {
        case interBlack = "Inter-Black"
        case interBlackItalic = "Inter-BlackItalic"
        case interBold = "Inter-Bold"
        case interBoldItalic = "Inter-BoldItalic"
        case interExtraBold = "Inter-ExtraBold"
        case interExtraBoldItalic = "Inter-ExtraBoldItalic"
        case interExtraLight = "Inter-ExtraLight"
        case interExtraLightItalic = "Inter-ExtraLightItalic"
        case interItalic = "Inter-Italic"
        case interLight = "Inter-Light"
        case interLightItalic = "Inter-LightItalic"
        case interMedium = "Inter-Medium"
        case interMediumItalic = "Inter-MediumItalic"
        case interRegular = "Inter-Regular"
        case interSemiBold = "Inter-SemiBold"
        case interSemiBoldItalic = "Inter-SemiBoldItalic"
        case interThin = "Inter-Thin"
        case interThinItalic = "Inter-ThinItalic"
    }
    
    static func getRegularFont(size: CGFloat) -> Font {
        return Font.custom(InterFonts.interRegular.rawValue, size: size)
    }
    
}
