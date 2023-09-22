//
//  PasswordModel.swift
//  MVVM Learn
//
//  Created by Руслан Ишмухаметов on 22.09.2023.
//

import Foundation
import SwiftUI

struct Password: Identifiable, Codable {
    var id = UUID()
    var password: String
    var containsSymbols: Bool
    var containsUppercase: Bool
    
    var strenghtColor: Color {
        var strenght = 0
        var color: Color
        
        if containsSymbols { strenght += 1 }
        if containsUppercase { strenght += 1 }
        if password.count > 12 {
            strenght += 1
        } else if password.count < 8 {
            strenght -= 1
        }
        
        switch strenght {
        case 1: color = .red
        case 2: color = .yellow
        case 3: color = .green
        default: color = .gray
        }
        
        return color
    }
    
}
