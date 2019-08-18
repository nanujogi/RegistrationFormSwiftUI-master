//  PasswordChecker.swift
//  RegistrationFormSwiftUI

import SwiftUI
import Combine

class EmailChecker: ObservableObject {
    
    let regExStr = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    var cancellable: AnyCancellable?
    
    // https://www.pointfree.co/blog/posts/30-swiftui-and-state-management-corrections
    @Published var emailIsValid: Bool = false
    @Published var emaillevel: CheckValidity = .none
    
    @Published var myEmail: String = ""
    
    @Published var email: String = "" {
        willSet {
            self.checkForemail(email: self.email)
        }
    }
    
    var validatedEMail: AnyPublisher<String?, Never> {
        return $myEmail
            //               .print("✏️ $myEmail pipeline")
            //            .debounce(for: 0.5, scheduler: q)
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { username in
                return Future { promise in
                    print("username: \(username)")
                    //DispatchQueue.main.async {
                    self.usernameAvailable(username, regExstr: self.regExStr) { available in
                        print("available: \(available)")
                        promise(.success(available ? username : nil))
                    }
                    //}
                }
        }
        .switchToLatest()
        .eraseToAnyPublisher()
    }
    
    func usernameAvailable(_ username: String, regExstr: String, completion: (Bool) -> Void) {
        let isValidEMailAddress: Bool = NSPredicate(format:"SELF MATCHES %@", regExstr).evaluate(with: username)
        completion(isValidEMailAddress)
    }
    
    
    func checkForemail(email: String) {
        
        // Check if valid password as per requirement is typed by user.
        let checkit = isValidEmail(email: email)
        
        if checkit {
            emailIsValid = true
            emaillevel = CheckValidity.correct

        } else {
            emailIsValid = false
            emaillevel = CheckValidity.wrong
        }
    }
    
    func isValidEmail(email: String) -> Bool {
        
        var returnValue = true
        // Requires: 1 upper/ 1 special & minimum 6 characters long password
        let passwordRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        //"[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
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
        
        //TODO: Trial Error
        
        return  returnValue
    }
}
