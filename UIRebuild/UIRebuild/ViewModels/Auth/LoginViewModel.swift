//
//  LoginViewModel.swift
//  UIRebuild
//
//  Created by admin on 20/10/2025.
//

import SwiftUI
import Foundation
import Combine


class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isLoggedIn = false
    @Published var errorMessage: String?
    @Published var shouldNavigateToMainView = false

    func login() {
        errorMessage = nil

        guard !username.isEmpty, !password.isEmpty else {
                 errorMessage = "Please enter both username and password."
                 return
             }
        
        APIClient.login(username: username, password: password) { result in
                 switch result {
                 case .success(let user):
                     SessionManager.shared.currentUser = user
                     SessionManager.shared.isLoggedIn = true
                     SessionManager.shared.saveToken(user.token)
                     self.shouldNavigateToMainView = true

                 case .failure(let error):
                     self.errorMessage = "Login failed: \(error.localizedDescription)"
                     self.errorMessage = self.parse(error: error)
                 }
             }
        }
    private func parse(error: Error) -> String {
            if let apiError = error as? APIClient.APIError {
                switch apiError {
                case .invalidURL:
                    return "Invalid backend URL"
                case .noData:
                    return "No data received from server"
                case .noResponse:
                    return "No response from server"
                case .invalidCredentials:
                    return "Invalid username or password"
                }
            }

            if let decodingError = error as? DecodingError {
                switch decodingError {
                case .keyNotFound(let key, let context):
                    return "Missing key '\(key.stringValue)' – \(context.debugDescription)"
                case .valueNotFound(_, let context):
                    return "Value not found – \(context.debugDescription)"
                case .typeMismatch(_, let context):
                    return "Type mismatch – \(context.debugDescription)"
                case .dataCorrupted(let context):
                    return "Data corrupted – \(context.debugDescription)"
                @unknown default:
                    return "Unknown decoding error"
                }
            }

            return error.localizedDescription
        }

    func signInWithApple() {
        print("Apple login tapped")
    }
}
