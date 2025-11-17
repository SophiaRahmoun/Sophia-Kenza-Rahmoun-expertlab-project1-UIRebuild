//
//  MenuViewModel.swift
//  UIRebuild
//
//  Created by admin on 17/11/2025.
//

import Foundation

class MenuViewModel: ObservableObject {
    
    @Published var isMenuOpen: Bool = false
    @Published var selectedDestination: MenuDestination? = nil

    
}
