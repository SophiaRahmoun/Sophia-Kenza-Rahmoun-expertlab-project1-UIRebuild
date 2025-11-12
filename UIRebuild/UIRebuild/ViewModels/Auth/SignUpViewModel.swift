//
//  SignUpViewModel.swift
//  UIRebuild
//
//  Created by admin on 21/10/2025.
//

import Foundation
import Combine

class SignUpViewModel: ObservableObject {
    @Published var email = ""
    @Published var username = ""
    @Published var password = ""

    func register() {
        guard let url = URL(string: "https://villo-backend.onrender.com/api/auth/register") else {
              print(" invalid URL")
              return
          }

          let body: [String: String] = [
              "email": email,
              "username": username,
              "password": password
          ]

          guard let jsonData = try? JSONSerialization.data(withJSONObject: body) else {
              print("Failed to encode json")
              return
          }

          var request = URLRequest(url: url)
          request.httpMethod = "POST"
          request.setValue("application/json", forHTTPHeaderField: "Content-Type")
          request.httpBody = jsonData

          URLSession.shared.dataTask(with: request) { data, response, error in
              DispatchQueue.main.async {
                  if let error = error {
                      print("Network error: \(error.localizedDescription)")
                      return
                  }

                  guard let data = data else {
                      print("no Data")
                      return
                  }

                  do {
                      let user = try JSONDecoder().decode(User.self, from: data)
                      print("registered successfully with token: \(user.token)")

                      UserDefaults.standard.set(user.token, forKey: "authToken")

                  } catch {
                      print("Registration failed : \(error.localizedDescription)")
                      print("Response : \(String(data: data, encoding: .utf8) ?? "None")")
                  }
              }
          }.resume()
      }
}
