//
//  PasswordTextField.swift
//  Edvora
//
//  Created by Ravindran on 16/12/21.
//

import SwiftUI

struct PasswordTextField: View {
    
    @Binding var value: String
    @State private var isEditing: Bool = false
    @State private var isSecured: Bool = true
    
    var body: some View {
        ZStack {
            if !isSecured {
                TextField("", text: $value) { edit in
                    self.isEditing = edit
                }
                .textFieldStyle(FocussedTextFieldStyle(focused: $isEditing))
                HStack {
                    Image("PasswordIcon")
                        .padding()
                    Spacer()
                    Button {
                        isSecured.toggle()
                    } label: {
                        Image(systemName: self.isSecured ? "eye.slash" : "eye")
                            .padding()
                            .foregroundColor(.accentColor)
                    }
                }
                HStack {
                    Text("Password")
                        .font(InterFontManager.getRegularFont(size: 12))
                        .foregroundColor(Color("TitleColor"))
                        .padding(EdgeInsets(top: 0, leading: 19.0, bottom: 54.0, trailing: 0))
                        .background(Rectangle().fill(Color("PlaceHolderColor")).padding(EdgeInsets(top: 0, leading: 16.0, bottom: 54.0, trailing: -3)))
                    Spacer()
                }
            } else {
                SecureField("", text: $value, onCommit: { isEditing = false })
                    .onTapGesture {
                        isEditing = true
                    }
                    .textFieldStyle(FocussedTextFieldStyle(focused: $isEditing))
                HStack {
                    Image("PasswordIcon")
                        .padding()
                    Spacer()
                    Button {
                        isSecured.toggle()
                    } label: {
                        Image(systemName: self.isSecured ? "eye.slash" : "eye")
                            .padding()
                            .foregroundColor(.accentColor)
                    }
                }
                HStack {
                    Text("Password")
                        .font(InterFontManager.getRegularFont(size: 12))
                        .foregroundColor(Color("TitleColor"))
                        .padding(EdgeInsets(top: 0, leading: 19.0, bottom: 54.0, trailing: 0))
                        .background(Rectangle().fill(Color("PlaceHolderColor")).padding(EdgeInsets(top: 0, leading: 16.0, bottom: 54.0, trailing: -3)))
                    Spacer()
                }
            }
        }
    }
}

struct PasswordTextField_Previews: PreviewProvider {
    @State static var value = ""
    static var previews: some View {
        PasswordTextField(value: $value)
    }
}
