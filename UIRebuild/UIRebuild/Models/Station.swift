//
//  Station.swift
//  UIRebuild
//
//  Created by admin on 18/10/2025.
//


import Foundation
import CoreLocation

struct StationResponse: Codable {
    let results: [Station]
}

struct Station: Codable, Identifiable {
    var id: String { villo_id }
    
    var bikes: [Bike] {
        // Temporary mock generation
        let count = Int.random(in: 3...bike_stands) // Rand av bikes
        return (0..<count).map { _ in
            Bike(type: Bool.random() ? .electric : .mechanical, isAvailable: true)
        }
    }

    let villo_id: String
    let name_fr: String?
    let name_nl: String?
    let address_fr: String?
    let address_nl: String?
    let pccp: String?
    let mu_fr: String?
    let mu_nl: String?
    let status: String
    let bike_stands: Int
    let geo_point_2d: GeoPoint
}

struct GeoPoint: Codable {
    let lon: Double
    let lat: Double

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
}
