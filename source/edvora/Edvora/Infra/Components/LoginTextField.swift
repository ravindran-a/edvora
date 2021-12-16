//
//  LoginTextField.swift
//  Edvora
//
//  Created by Ravindran on 16/12/21.
//

import SwiftUI

struct LoginTextField: View {
    
    @Binding var value: String
    var placeHolder: String = ""
    var fieldIcon: String = ""
    @State private var isEditing: Bool = false
    
    var body: some View {
        ZStack {
            TextField("", text: $value) { edit in
                self.isEditing = edit
            }
            .textFieldStyle(FocussedTextFieldStyle(focused: $isEditing))
            HStack {
                Image(fieldIcon)
                    .padding()
                Spacer()
            }
            HStack {
                Text(placeHolder)
                    .font(InterFontManager.getRegularFont(size: 12))
                    .foregroundColor(Color("TitleColor"))
                    .padding(EdgeInsets(top: 0, leading: 19.0, bottom: 54.0, trailing: 0))
                    .background(Rectangle().fill(Color("PlaceHolderColor")).padding(EdgeInsets(top: 0, leading: 16.0, bottom: 54.0, trailing: -3)))
                Spacer()
            }
        }
    }
}

struct LoginTextField_Previews: PreviewProvider {
    @State static var value = ""
    static var previews: some View {
        LoginTextField(value: $value, placeHolder: "UserName", fieldIcon: "PersonIcon")
    }
}
