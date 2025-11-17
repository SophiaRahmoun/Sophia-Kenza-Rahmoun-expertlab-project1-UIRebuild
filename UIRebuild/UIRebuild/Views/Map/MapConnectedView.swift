//
//  MapConnectedView.swift
//  UIRebuild
//
//  Created by admin on 10/11/2025.
//

import SwiftUI
import MapKit

struct MapConnectedView: View {
    @EnvironmentObject var mapViewModel: MapViewModel

    var body: some View {
        ZStack {
            Map(coordinateRegion: $mapViewModel.region)
                .ignoresSafeArea()

            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        mapViewModel.recenterMap()
                    }) {
                        Image(systemName: "location.fill")
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                    .padding(.trailing, 10)

                    Button(action: {
                        withAnimation {
                            mapViewModel.isFilterPresented = true
                        }
                    }) {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                    .padding(.trailing, 20)
                }
                .padding(.bottom, 20)
            }
        }
    }
}

#Preview {
    MapConnectedView()
        .environmentObject(MapViewModel())
}
