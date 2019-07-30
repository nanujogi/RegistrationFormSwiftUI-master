//  ValidityCheck.swift
//  RegistrationFormSwiftUI

import SwiftUI

enum CheckValidity: Int {
    case none = 0
    case correct = 1
    case wrong = 2
}

struct ValidityCheck: View {
    
    var textValidity: CheckValidity = .none
    
    var body: some View {
        Image(systemName: sfFonts.getName(.checkmarkCircleFill)())
            .foregroundColor(self.getColor()[0])
        .font(.headline)
    }
    
    func getColor() ->[Color] {
        switch self.textValidity {
        case .none:
            return [.clear]
        case .correct:
            return [.green]
        case .wrong:
            return [.red]
        }
    }
}

