//
//  StationDetailsView.swift
//  UIRebuild
//
//  Created by admin on 19/11/2025.
//

import SwiftUI

struct StationDetailsView: View {
    let station: FavoriteStation  
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Station Details")
                .font(.largeTitle)
            
            Text(station.name)
                .font(.title2)
            
            Text(station.address)
                .foregroundColor(.gray)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    StationDetailsView(station: FavoriteStation(name: "Test", address: "Somewhere"))
}
