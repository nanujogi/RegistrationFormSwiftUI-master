//  PasswordChecker.swift
//  RegistrationFormSwiftUI

import SwiftUI
import Combine

class EmailChecker: ObservableObject {

    // https://www.pointfree.co/blog/posts/30-swiftui-and-state-management-corrections
    @Published var emailIsValid: Bool = false
    @Published var emaillevel: CheckValidity = .none

    var email: String = "" {
        willSet {
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



