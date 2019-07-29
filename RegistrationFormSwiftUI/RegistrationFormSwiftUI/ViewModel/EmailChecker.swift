//  PasswordChecker.swift
//  RegistrationFormSwiftUI

import Foundation
import UIKit
import SwiftUI
import Combine

class EmailChecker: BindableObject {
    
    public let willChange = PassthroughSubject<EmailChecker, Never>()
    
    var emailIsValid: Bool = false {
        didSet {
            self.willChange.send(self)
        }
    }
    // enum is define in ValidityCheck.swift
    // We use here to send changes to main view.
    var emaillevel: CheckValidity = .none {
        didSet {
            self.willChange.send(self)
        }
    }
    // we get the password user typed in this variable
    // we check call our function to check validity of password.
    var email: String = "" {
        didSet {
            self.checkForemail(email: self.email.lowercased())
        }
    }
    
    func checkForemail(email: String) {
        
        // Check if valid password as per requirement is typed by user.
        let checkit = isValidPassword(email: email)
        
        if checkit {
            print("Email is valid \(email)")
            emailIsValid = true
            emaillevel = CheckValidity.correct
        // not valid
        } else {
            emailIsValid = false
            emaillevel = CheckValidity.wrong
        }
    }
    
    func isValidPassword(email: String) -> Bool {
        
        var returnValue = true
        // Requires: 1 upper/ 1 special & minimum 6 characters long password
        let passwordRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: passwordRegEx)
            let nsString = email as NSString
            let results = regex.matches(in: email, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0 {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        return  returnValue
    }
}

