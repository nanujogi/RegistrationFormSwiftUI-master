//  ContentView.swift
//  RegistrationFormSwiftUI

import SwiftUI

struct ContentView : View {
    
    @State private var name: String = ""
    @State private var terms: Bool = false
    
    @ObjectBinding var passwordChecker = PasswordChecker()
    @ObjectBinding var emailChecker = EmailChecker()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Your Info")) {
                    TextField("Name here...", text: $name)
                    
                    HStack {
                        TextField("Email... ", text: $emailChecker.email, onCommit: {self.emailFunc()})
                        
                        // validity true
                        if self.emailChecker.emailIsValid {
                            ValidityCheck(textValidity: .correct)
                        }
                        else {
                            ValidityCheck(textValidity: .wrong)
                        }
                    }
                }
                Section(header: Text("Password")) {
                    HStack {
                        SecureField("Requires numbers, special characters", text: $passwordChecker.password, onCommit: { self.njFunc() })
                        
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
                    if self.passwordChecker.validity {
                        Toggle(isOn: $terms) {
                            Text("Accept the terms and conditions")
                        }
                        if self.terms {
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
