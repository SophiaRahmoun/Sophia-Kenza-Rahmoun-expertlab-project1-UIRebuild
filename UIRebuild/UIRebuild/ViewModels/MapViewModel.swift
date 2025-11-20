//
//  MapViewModel.swift
//  UIRebuild
//
//  Created by admin on 20/10/2025.
//

import Foundation
import MapKit

class MapViewModel: ObservableObject {
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 50.8503, longitude: 4.3517),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    @Published var selectedStation: Station? = nil
    @Published var isReserveBikePresented = false
    
    
    @Published var selectedFilter: FilterOption? = nil
    @Published var isFilterPresented = false
    
    @Published var selectedFilters: Set<FilterOption> = []
    @Published var availability: [StationAvailability] = []

    @Published var stations: [Station] = []
    private let stationService = StationService()
    
    init() {
           loadStations()
       }

    func loadStations() {
        stationService.fetchStations { [weak self] (result: Swift.Result<[Station], Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let stations):
                    self?.stations = stations
                    print("Loaded Villo stations:", stations.count)
                case .failure(let error):
                    print("Error loading Villo stations:", error)
                }
            }
        }
    }
    
    func selectStation(_ station: Station) {
        selectedStation = station
        isReserveBikePresented = true
        loadAvailability() // Load availability when station is selected
    }

    func recenterMap() {
           region.center = CLLocationCoordinate2D(latitude: 50.8503, longitude: 4.3517)
       }
    
    func toggleFilter(_ filter: FilterOption) {
            if selectedFilters.contains(filter) {
                selectedFilters.remove(filter)
            } else {
                selectedFilters.insert(filter)
            }
        }
    
    private let availabilityService = StationAvailabilityService()

    func loadAvailability() {
        availabilityService.fetchAvailability { [weak self] records in
            DispatchQueue.main.async {
                self?.availability = records
            }
        }
    }

    func availabilityFor(_ station: Station) -> StationAvailability? {
        availability.first { $0.number == station.villo_id }
    }
    
}
