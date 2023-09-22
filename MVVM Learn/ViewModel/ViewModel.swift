//
//  ViewModel.swift
//  MVVM Learn
//
//  Created by Руслан Ишмухаметов on 22.09.2023.
//

import Foundation
import SwiftUI

extension ContentView {
    class ViewModel: ObservableObject {
        @Published var passwords: [Password] = []
        @Published var containsSymbols = true
        @Published var containsUppercase = false
        @Published var lenght = 10
        
        init() {
            createPassword()
        }
        
        func createPassword() {
            let alphabet = "abcdefghijklmnopqrstuvwxyz"
            var base = alphabet + "0123456789"
            var newPassowrd = ""
            
            if containsSymbols {
                base += "!@£$%^&*()?"
            }
            
            if containsUppercase {
                base += alphabet.uppercased()
            }
            
            for _ in 0..<lenght {
                let randomChar = base.randomElement()!
                newPassowrd += String(randomChar)
            }
            
            let password = Password(password: newPassowrd, containsSymbols: containsSymbols, containsUppercase: containsUppercase)
            
            withAnimation {
                passwords.insert(password, at: 0)
            }
        }

    }
}
