//  allSF.swift
//  Created by Nanu Jogi on 28/07/19.

import Foundation

enum sfFonts: String {
    case circle0, circle00, circleFill0, circleFill00, square0, square00, squareFill0, squareFill00, circle1, circle01, circleFill1, circleFill01,
    magnifyingglass1, square1, square01, squareFill1, squareFill01, circle2, circle02, personperson,
    
    checkmarkCircleFill, checkmarkCircle
    
    func getName() -> String {
        switch self {
        case .circle0:
            return "0.circle"
        case .circle00:
            return "00.circle"
        case .circleFill0:
            return "0.circle.fill"
        case .circleFill00:
            return "00.circle.fill"
        case .square0:
            return "0.square"
        case .square00:
            return "00.square"
        case .squareFill0:
            return "0.square.fill"
        case .squareFill00:
            return "00.square.fill"
        case .circle1:
            return "1.circle"
        case .circle01:
            return "01.circle"
        case .circleFill1:
            return "1.circle.fill"
        case .circleFill01:
            return "01.circle.fill"
        case .magnifyingglass1:
            return "1.magnifyingglass"
        case .square1:
            return "1.square"
        case .square01:
            return "01.square"
        case .squareFill1:
            return "1.square.fill"
        case .squareFill01:
            return "01.square.fill"
        case .circle2:
            return "2.circle"
        case .circle02:
            return "02.circle"
        case .personperson:
            return "person.and.person"

            
            
            
            
            
            
            
            

            
            
        case .checkmarkCircleFill:
            return "checkmark.circle.fill"
        case .checkmarkCircle:
            return "checkmark.circle"
       
        }
    }
}
