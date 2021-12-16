//
//  LoginView.swift
//  Edvora
//
//  Created by Ravindran on 16/12/21.
//

import SwiftUI
import Combine

struct LoginView: View {
    
    @StateObject var loginViewModel = LoginViewModel()
    @State var showSignUpView: Bool = false
    @State var showHomeView: Bool = false
    @State var showForgotPasswordView: Bool = false
    @State var userName: String = ""
    @State var password: String = ""
    @State var emailAddress: String = ""
    @State var isEditing = false
    @State var showAlert = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                loginView
            }
            .preferredColorScheme(.light)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Enter Valid Credential"), message: Text(loginViewModel.alertMessage), dismissButton: .default(Text("OK"), action: {}))
            }
        }
    }
    
    var loginView: some View {
        VStack(spacing: 90) {
            LogoImage()
            signUpFields
            loginButton
                .padding(EdgeInsets(top: 8, leading: 36.0, bottom: 8, trailing: 36.0))
        }
    }
    
    var forgotPasswordButton: some View {
        Button {
            showForgotPasswordView = true
        } label: {
            Text("Forgotten password?")
                .font(InterFontManager.getMediumFont(size: 15.0))
                .foregroundColor(.accentColor)
                .multilineTextAlignment(.trailing)
        }
    }
    
    var loginButton: some View {
        VStack(spacing: 30) {
            NavigationLink("", destination: HomeView(), isActive: $showHomeView)
            Button {
                loginViewModel.loginRequest.userName = self.userName
                loginViewModel.loginRequest.emailAddress = self.emailAddress
                loginViewModel.loginRequest.password = self.password
                loginViewModel.validateFields { isValid in
                    if isValid {
                        showHomeView = true
                    } else {
                        showAlert = true
                    }
                }
            } label: {
                Text("LOGIN")
            }.buttonStyle(FilledButton(fillColor: Color("ButtonColor"), font: InterFontManager.getSemiBoldFont(size: 20.0), foregroundColor: .white))
            signUpButton
        }
    }
    
    var signUpButton: some View {
        Button {
            showSignUpView = true
        } label: {
            Text("Don’t have an account? ")
                .font(InterFontManager.getRegularFont(size: 15.0))
                .foregroundColor(Color("TitleColor"))
            +
            Text("Sign up")
                .font(InterFontManager.getRegularFont(size: 15.0))
                .foregroundColor(.accentColor)
        }
    }
    
    var signUpFields: some View {
        VStack(spacing: 25) {
            LoginTextField(value: $userName, placeHolder: "Username", fieldIcon: "PersonIcon")
                .autocapitalization(.none)
            PasswordTextField(value: $password)
            LoginTextField(value: $emailAddress, placeHolder: "Email address", fieldIcon: "EmailNotationIcon")
                .autocapitalization(.none)
            HStack {
                Spacer()
                forgotPasswordButton
            }
        }.padding(EdgeInsets(top: 0, leading: 36.0, bottom: 0, trailing: 36.0))
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
            LoginView()
                .previewDevice("iPhone 13")
            LoginView()
                .previewDevice("iPhone SE (2nd generation)")
            LoginView()
                .previewDevice("iPad Air (4th generation)")
        }
    }
}
