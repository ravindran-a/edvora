//
//  Buttons.swift
//  Edvora
//
//  Created by Ravindran on 16/12/21.
//

import Foundation
import SwiftUI

struct FilledButton: ButtonStyle {
    
    var fillColor: Color
    var font: Font
    var foregroundColor: Color = .white
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .foregroundColor(foregroundColor)
            .font(font)
            .background(RoundedRectangle(cornerRadius: 13.0).fill(fillColor))
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
    
}
