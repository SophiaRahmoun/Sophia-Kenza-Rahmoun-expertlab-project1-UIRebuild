//
//  StationAvailabilityService.swift
//  UIRebuild
//
//  Created by admin on 19/11/2025.
//

import Foundation

class StationAvailabilityService {

    func fetchAvailability(completion: @escaping ([StationAvailability]) -> Void) {

        guard let url = URL(string:
            "https://opendata.bruxelles.be/api/explore/v2.1/catalog/datasets/disponibilite-en-temps-reel-des-velos-villo-rbc/records?limit=300"
        ) else {
            completion([])
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in

            guard let data = data else {
                print("Networking error:", error ?? "Unknown")
                completion([])
                return
            }

            print("RAW AVAILABILITY JSON:", String(data: data, encoding: .utf8) ?? "NONE")

            do {
                let decoded = try JSONDecoder().decode(AvailabilityResponse.self, from: data)
                completion(decoded.results)
            }
            catch {
                print("❌ Availability decoding error:", error)
                completion([])
            }

        }.resume()
    }
}

