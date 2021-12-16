//
//  LoginViewModel.swift
//  Edvora
//
//  Created by Ravindran on 16/12/21.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var loginRequest = LoginRequest()
    
    func validateUserName() -> Bool {
        var isValid = true
        return isValid
    }
    
    func validatePassword() -> Bool {
        var isValid = true
        return isValid
    }
    
    func validateEmailAddress() -> Bool {
        var isValid = true
        return isValid
    }
}
