//
//  LoginViewModel.swift
//  Edvora
//
//  Created by Ravindran on 16/12/21.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var loginRequest = LoginRequest()
    var alertMessage = ""
    
    func validateFields(completion: @escaping (Bool) -> Void) {
        if let confirmedUserName = loginRequest.userName, !confirmedUserName.isEmpty {
            let isUserNameValid = isValidUserName(confirmedUserName)
            if !isUserNameValid {
                alertMessage = "Username cannot contain white spaces and Capital Letters"
                completion(false)
                return
            }
        } else {
            alertMessage = "Username cannot be empty"
            completion(false)
            return
        }
        if let confirmedPassword = loginRequest.password, !confirmedPassword.isEmpty {
            let isPasswordValid = isValidPassword(confirmedPassword)
            if !isPasswordValid {
                alertMessage = "Password should have minimum 8 characters, 1 number, 1 upper case alphabet and 1 lower case alphabet"
                completion(false)
                return
            }
        } else {
            alertMessage = "Password cannot be empty"
            completion(false)
            return
        }
        if let confirmedEmail = loginRequest.emailAddress, !confirmedEmail.isEmpty {
            let isEmailValid = isValidEmail(confirmedEmail)
            if !isEmailValid {
                alertMessage = "Enter a valid Email Id"
                completion(false)
                return
            }
        } else {
            alertMessage = "Email cannot be empty"
            completion(false)
            return
        }
        completion(true)
        return
    }

    private func isValidUserName(_ userName: String) -> Bool {
        return !userName.hasCharacter(in: .whitespacesAndNewlines) && !userName.hasCharacter(in: .uppercaseLetters)
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        guard emailPredicate.evaluate(with: email) else { return false }
        return true
    }
    
    private func isValidPassword(_ password: String) -> Bool {
        if password.count < 8 {
            return false
        }
        
        if !password.hasCharacter(in: .lowercaseLetters) {
            return false
        }
        
        if !password.hasCharacter(in: .uppercaseLetters) {
            return false
        }
        
        let numberRegEx  = ".*[0-9]+.*"
        let numberPredicate = NSPredicate(format: "SELF MATCHES %@", numberRegEx)
        guard numberPredicate.evaluate(with: password) else { return false }
        
        let specialCharacterRegEx  = ".*[!&^%$#@()/_*+-]+.*"
        let specialCharacterPredicate = NSPredicate(format: "SELF MATCHES %@", specialCharacterRegEx)
        guard specialCharacterPredicate.evaluate(with: password) else { return false }

        return true
    }
    
}
