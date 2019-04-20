//
//  StringExtension.swift
//  TestProject
//
//  Created by MAC on 4/20/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

extension String {
    
     func formattedNumber() -> String {
        let unformatedNuber = self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = "+X (XXX) XXX-XXXX"
        
        var result = ""
        var index = unformatedNuber.startIndex
        for ch in mask where index < unformatedNuber.endIndex {
            if ch == "X" {
                result.append(unformatedNuber[index])
                index = unformatedNuber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
}
