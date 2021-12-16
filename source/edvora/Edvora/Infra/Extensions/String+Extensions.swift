//
//  String+Extensions.swift
//  Edvora
//
//  Created by Ravindran on 16/12/21.
//

import Foundation

extension String {
    func hasCharacter(in characterSet: CharacterSet) -> Bool {
        return rangeOfCharacter(from: characterSet) != nil
    }
}
