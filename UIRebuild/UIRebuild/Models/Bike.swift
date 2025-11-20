//
//  Bike.swift
//  UIRebuild
//
//  Created by admin on 20/10/2025.
//

import Foundation

enum BikeType: String, Codable {
    case electric
    case mechanical
}

struct Bike: Identifiable, Codable {
    let id = UUID()
    let type: BikeType
    let isAvailable: Bool
}
