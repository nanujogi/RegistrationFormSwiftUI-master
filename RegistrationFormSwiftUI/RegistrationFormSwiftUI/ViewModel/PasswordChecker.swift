//  PasswordChecker.swift
//  RegistrationFormSwiftUI

import SwiftUI
import Combine

class PasswordChecker: ObservableObject {
    
//    public let willChange = PassthroughSubject<PasswordChecker, Never>()
    
    @Published var validity: Bool = false {
        willSet {
            objectWillChange.send()
 //           self.willChange.send(self)
        }
    }
    // PasswordValidity enum is define in ValidityCheck.swift
    // We use here to send changes to main view.
    @Published var passwordlevel: CheckValidity = .none {
        willSet {
            objectWillChange.send()
//            self.willChange.send(self)
        }
    }
    // we get the password user typed in this variable
    // we check call our function to check validity of password.
    var password: String = "" {
        didSet {
            self.checkForPassword(password: self.password)
        }
    }
    
    func checkForPassword(password: String) {
        
        // Check if valid password as per requirement is typed by user.
        let checkit = isValidPassword(password: password)
        
        if checkit {
            print("Password valid")
            validity = true
            passwordlevel = CheckValidity.correct
            
        // not valid
        } else {
            validity = false
            passwordlevel = CheckValidity.wrong
        }
    }
    
    func isValidPassword(password: String) -> Bool {
        
        var returnValue = true
        // Requires: 1 upper/ 1 special & minimum 6 characters long password
        let passwordRegEx = "^(?=\\P{Ll}*\\p{Ll})(?=\\P{Lu}*\\p{Lu})(?=\\P{N}*\\p{N})(?=[\\p{L}\\p{N}]*[^\\p{L}\\p{N}])[\\s\\S]{6,}$"
        
        do {
            let regex = try NSRegularExpression(pattern: passwordRegEx)
            let nsString = password as NSString
            let results = regex.matches(in: password, range: NSRange(location: 0, length: nsString.length))
            
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
