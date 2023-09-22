//
//  ContentView.swift
//  MVVM Learn
//
//  Created by Руслан Ишмухаметов on 22.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = ViewModel()
    
    var body: some View {
        
        Form {
            Section("Options") {
                Toggle("Symbols", isOn: $vm.containsSymbols)
                Toggle("Uppercase", isOn: $vm.containsUppercase)
                Stepper("Character count: \(vm.lenght)", value: $vm.lenght, in: 6...18)
                Button("Create password", action: vm.createPassword)
                    .centerH()
            }
            
            Section("Passwords") {
                List(vm.passwords) { password in
                    HStack{
                        Text("\(password.password)")
                            .padding(.horizontal)
                            .textSelection(.enabled)
                        Spacer()
                        Image(systemName: "lock.fill")
                            .foregroundColor(password.strenghtColor)
                    }
                }
            }
        }
        .addTittleNavigationView(tittle: "iPassword")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
