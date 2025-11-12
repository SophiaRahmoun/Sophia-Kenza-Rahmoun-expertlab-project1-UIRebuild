//
//  User.swift
//  UIRebuild
//
//  Created by admin on 20/10/2025.
//

struct User: Codable {
    let id: String
    let username: String
    let email: String?
    let token: String
    enum CodingKeys: String, CodingKey {
          case id = "_id"
          case username
          case email
          case token
      }
}
