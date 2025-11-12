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
    
    @Published var selectedFilter: FilterOption? = nil
    @Published var isFilterPresented = false

    func recenterMap() {
        // TODO: replace w users loc
        region.center = CLLocationCoordinate2D(latitude: 50.8503, longitude: 4.3517)
    }
}
