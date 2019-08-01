//
//  discard.swift
//  RegistrationFormSwiftUI
//
//  Created by Nanu Jogi on 01/08/19.
//  Copyright © 2019 Kevin Maarek. All rights reserved.
//

import Foundation

// Trial Error
        
//        let q = DispatchQueue(label: "com.grenleaf.com")
//
//        let emailcancellable = $email
//            .debounce(for: 0.5, scheduler: q)
//            .map({ (data) -> String in
//                return data.lowercased()
//            })
//            .receive(on: RunLoop.main)
//
//            .sink(receiveCompletion: { fini in
//                switch fini {
//                case .finished :
//                    print(".sink() receiveCompletion", String(describing: fini))
//                case .failure:
//                    print("Error in receiveCompletion")
//                }
//            }, receiveValue: { someValue in
//                self.email = someValue
////u                print(".sink() receiveValue \(someValue)\n")
//            })
//
//        cancellable = AnyCancellable(emailcancellable)
