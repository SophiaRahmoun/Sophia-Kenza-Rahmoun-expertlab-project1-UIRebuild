//
//  APIClient.swift
//  UIRebuild
//
//  Created by admin on 07/11/2025.
//

import Foundation

struct APIClient {
    static let baseURL = "https://villo-backend.onrender.com"

    static func login(username: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/api/auth/login") else {
            completion(.failure(APIError.invalidURL))
            return
        }

        let body: [String: String] = [
            "username": username,
            "password": password
        ]

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
        } catch {
            completion(.failure(error))
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print(" Network error:", error)
                    completion(.failure(error))
                    return
                }

                if let httpResponse = response as? HTTPURLResponse {
                    print(" HTTP STATUS CODE:", httpResponse.statusCode)
                    print(" CONTENT-TYPE:", httpResponse.allHeaderFields["Content-Type"] ?? "N/A")
                }

                guard let data = data else {
                    print(" No data received.")
                    completion(.failure(APIError.noData))
                    return
                }

                if let jsonString = String(data: data, encoding: .utf8) {
                    print(" Raw JSON received in string:", jsonString)
                    print(jsonString)
                } else {
                    print(" Could not decode data to UTF-8 string.")
                }

                do {
                    let user = try JSONDecoder().decode(User.self, from: data)
                    print(" Successfully decoded user:", user)
                    completion(.success(user))
                } catch let DecodingError.dataCorrupted(context) {
                    print(" Data corrupted:", context)
                    completion(.failure(DecodingError.dataCorrupted(context)))
                } catch let DecodingError.keyNotFound(key, context) {
                    print(" Key '\(key)' not found:", context.debugDescription)
                    print("Coding path:", context.codingPath)
                    completion(.failure(DecodingError.keyNotFound(key, context)))
                } catch let DecodingError.valueNotFound(value, context) {
                    print(" Value '\(value)' not found:", context.debugDescription)
                    print("Coding path:", context.codingPath)
                    completion(.failure(DecodingError.valueNotFound(value, context)))
                } catch let DecodingError.typeMismatch(type, context) {
                    print(" Type '\(type)' mismatch:", context.debugDescription)
                    print("Coding path:", context.codingPath)
                    completion(.failure(DecodingError.typeMismatch(type, context)))
                } catch {
                    print(" Unknown decoding error:", error)
                    completion(.failure(error))
                }
            }
        }.resume()
    }

    enum APIError: Error {
        case invalidURL
        case noData
        case noResponse
        case invalidCredentials
    }
}
