//
//  StationService.swift
//  UIRebuild
//
//  Created by admin on 20/10/2025.
//

import Foundation

class StationService {
    
    func fetchStations(completion: @escaping (Swift.Result<[Station], Error>) -> Void) {
        
        let url = URL(string: "https://opendata.brussels.be/api/explore/v2.1/catalog/datasets/stations-villo-bruxelles-rbc/records?limit=100")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let decoded = try JSONDecoder().decode(StationResponse.self, from: data)
                completion(.success(decoded.results))
            } catch {
                completion(Swift.Result.failure(error))
            }
            
        }.resume()
    }
}
