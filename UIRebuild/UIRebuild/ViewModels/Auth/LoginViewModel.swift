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
    @Published var isLoggedIn = false
    @Published var errorMessage: String?
    @Published var shouldNavigateToMainView = false

    func login() {
        guard !username.isEmpty, !password.isEmpty else {
                 errorMessage = "Please enter both username and password."
                 return
             }
        
        APIClient.login(username: username, password: password) { result in
                 switch result {
                 case .success(let user):
                     SessionManager.shared.saveToken(user.token)
                     self.shouldNavigateToMainView = true
                     self.errorMessage = nil
                     print("Login success: \(user.token)")

                 case .failure(let error):
                     self.errorMessage = "Login failed: \(error.localizedDescription)"
                     print("Login error: \(error.localizedDescription)")
                 }
             }
        }

    func signInWithApple() {
        print("Apple login tapped")
    }
}
