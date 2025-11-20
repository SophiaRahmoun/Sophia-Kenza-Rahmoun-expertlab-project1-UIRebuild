//
//  AvailabilityResponse.swift
//  UIRebuild
//
//  Created by admin on 19/11/2025.
//

import Foundation

struct AvailabilityResponse: Codable {
    let total_count: Int
    let results: [StationAvailability]
}

struct StationAvailability: Codable, Identifiable {
    var id: String { number }

    let number: String
    let available_bikes: Int
    let available_bike_stands: Int
    let bike_stands: Int
}

struct StationContainer: Codable {
    let results: [Station]?
    let items: [Station]?
}
