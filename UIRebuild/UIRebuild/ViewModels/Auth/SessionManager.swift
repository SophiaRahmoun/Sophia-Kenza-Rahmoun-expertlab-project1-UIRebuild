//
//  SessionManager.swift
//  UIRebuild
//
//  Created by admin on 07/11/2025.
//

import Foundation
import Combine

class SessionManager: ObservableObject {
    static let shared = SessionManager()
    
    @Published var isLoggedIn: Bool = false

    private init() {
        if let _ = UserDefaults.standard.string(forKey: "authToken") {
            isLoggedIn = true
        }
    }

    func saveToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: "authToken")
        isLoggedIn = true
    }

    func logout() {
        UserDefaults.standard.removeObject(forKey: "authToken")
        isLoggedIn = false
    }

    func getToken() -> String? {
        return UserDefaults.standard.string(forKey: "authToken")
    }
}
