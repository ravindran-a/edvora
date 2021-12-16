//
//  LoginRequest.swift
//  Edvora
//
//  Created by Ravindran on 16/12/21.
//

import Foundation

struct LoginRequest: Codable {
    var userName: String?
    var password: String?
    var emailAddress: String?
    
    enum CodingKeys: String, CodingKey {
        case userName
        case password
        case emailAddress
    }
}
