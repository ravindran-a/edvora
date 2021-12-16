//
//  TextFields.swift
//  Edvora
//
//  Created by Ravindran on 16/12/21.
//

import Foundation
import SwiftUI

struct FocussedTextFieldStyle: TextFieldStyle {
    
    @Binding var focused: Bool
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(EdgeInsets(top: 16, leading: 38, bottom: 16, trailing: 16))
            .font(InterFontManager.getRegularFont(size: 17))
            .foregroundColor(Color("TextColor"))
            .background(RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                            .fill(Color("PlaceHolderColor"))
                            .background(RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                                            .stroke(focused ? Color.accentColor : Color("BorderColor"))))
    }
    
}
