//
//  LoginViewModel.swift
//  UIRebuild
//
//  Created by admin on 20/10/2025.
//
import SwiftUI
import Foundation

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""

    func login() {
        print("Logging in with \(username) / \(password)")
    }

    func signInWithApple() {
        print("Apple login tapped")
    }
}
