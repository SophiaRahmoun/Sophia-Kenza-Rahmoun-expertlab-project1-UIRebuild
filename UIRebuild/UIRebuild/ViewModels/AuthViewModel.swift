//
//  AuthViewModel.swift
//  UIRebuild
//
//  Created by admin on 20/10/2025.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false

    func logIn() {
        isLoggedIn = true}

    func logOut() {
        isLoggedIn = false}
}
