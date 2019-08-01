//  ContentView.swift
//  RegistrationFormSwiftUI

import SwiftUI

struct ContentView : View {
    
    @State private var name: String = ""
    @State private var terms: Bool = false
    
    @ObservedObject var passwordChecker = PasswordChecker()
    @ObservedObject var emailChecker = EmailChecker()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Your Info")) {
                    TextField("Name here...", text: $name)
                        .keyboardType(.webSearch)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    HStack {
                        TextField("Email here... ", text: $emailChecker.email, onCommit: {self.emailFunc()})
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.alphabet)
                        
                        // if user has typed anything in email TextField
                        if emailChecker.email.count > 0 {
                            if self.emailChecker.emailIsValid {
                                ValidityCheck(textValidity: .correct)
                            }
                            else {
                                ValidityCheck(textValidity: .wrong)
                            }
                        } else {
                            ValidityCheck(textValidity: .none)
                        }
                    }
                }
                Section(header: Text("Password")) {
                    HStack {
                        SecureField("Requires numbers, special characters", text: $passwordChecker.password, onCommit: { self.njFunc() })
                           .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        // validity true
                        if self.passwordChecker.validity {
                            ValidityCheck(textValidity: .correct)
                        }
                        else {
                            ValidityCheck(textValidity: .wrong)
                        }
                    }
                }
                Section {
                    //                    if self.passwordChecker.validity && self.emailChecker.emailIsValid {
                    if self.passwordChecker.validity && self.emailChecker.emailIsValid {
                        Toggle(isOn: $terms) {
                            Text("Accept the terms and conditions")
                        }
                        // If user types correct email first time & then removes it we need to check that to.
                        
                        if self.terms && self.passwordChecker.validity && self.emailChecker.emailIsValid  {
                            Button(action: {
                                print("\n✅ Registered your account with\nemail: \(self.emailChecker.email)\npassword: \(self.passwordChecker.password)")
                            }) {
                                Text("Register")
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Registration Form"))
        }
    }
    
    func njFunc() {
        print("password typed is \($passwordChecker.password.value)")
    }
    
    func emailFunc() {
        print("password typed is \($emailChecker.email.value)")
    }
}
