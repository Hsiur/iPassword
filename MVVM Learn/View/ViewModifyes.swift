//
//  ViewModifyes.swift
//  MVVM Learn
//
//  Created by Руслан Ишмухаметов on 22.09.2023.
//

import SwiftUI

extension View {
    func centerH() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
    
    func addTittleNavigationView(tittle: String) -> some View {
        NavigationView {
            self
                .navigationTitle(tittle)
        }
    }
}
