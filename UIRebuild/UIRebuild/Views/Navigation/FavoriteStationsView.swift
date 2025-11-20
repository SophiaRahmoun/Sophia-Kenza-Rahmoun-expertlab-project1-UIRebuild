//
//  FavoriteStationsView.swift
//  UIRebuild
//
//  Created by admin on 19/11/2025.
//



import SwiftUI

struct FavoriteStationsView: View {
  
    @Environment(\.dismiss) var dismiss
    @State private var navigateToStationDetails = false

    @State private var favorites: [Station] = [
        Station(
            villo_id: "50",
            name_fr: "Agora",
            name_nl: "Agora",
            address_fr: "Agoraplein 120",
            address_nl: nil,
            pccp: "1000",
            mu_fr: "Bruxelles",
            mu_nl: "Brussel",
            status: "OPEN",
            bike_stands: 20,
            geo_point_2d: GeoPoint(lon: 4.3517, lat: 50.8503)
        ),
        Station(
            villo_id: "12",
            name_fr: "Gare Centrale",
            name_nl: "Centraal Station",
            address_fr: "Keizerlaan 16",
            address_nl: nil,
            pccp: "1000",
            mu_fr: "Bruxelles",
            mu_nl: "Brussel",
            status: "OPEN",
            bike_stands: 20,
            geo_point_2d: GeoPoint(lon: 4.357, lat: 50.846)
        )
    ]

    @State private var selectedStation: Station? = nil

    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()

                VStack(alignment: .leading, spacing: 30) {

                    // Close button
                    HStack {
                        Button { dismiss() } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 30, weight: .bold))
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 26)
                    .padding(.top, 20)

                    Text("Favorite Stations")
                        .font(AppTypography.h1)
                        .foregroundColor(.black)
                        .padding(.horizontal, 26)

                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(favorites, id: \.villo_id) { station in
                                stationCard(station)
                            }
                        }
                        .padding(.horizontal, 26)
                        .padding(.bottom, 40)
                    }
                }
            }
            .navigationDestination(isPresented: $navigateToStationDetails) {
                if let station = selectedStation {
                    StationDetailsView(station: station)
                }
            }
        }
    }

    private func stationCard(_ station: Station) -> some View {
        Button {
            selectedStation = station
            navigateToStationDetails = true
        } label: {
            ZStack(alignment: .topLeading) {

                RoundedRectangle(cornerRadius: 22)
                    .fill(Color(hex: "1D1B20"))
                    .frame(height: 160)

                VStack(alignment: .leading, spacing: 8) {
                    Text(station.name_fr ?? "Unknown")
                        .font(AppTypography.h2)
                        .foregroundColor(.white)
                        .padding(.top, 18)

                    Text(station.address_fr ?? "No address available")
                        .font(AppTypography.p)
                        .foregroundColor(.white.opacity(0.8))
                        .fixedSize(horizontal: false, vertical: true)

                    Spacer()
                }
                .padding(.horizontal, 20)

                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            remove(station)
                        } label: {
                            Image(systemName: "heart.fill")
                                .foregroundColor(Color(hex: "FFAE00"))
                                .font(.system(size: 26))
                                .padding(10)
                        }
                    }
                }
                .padding(10)
            }
        }
        .buttonStyle(.plain)
    }

    private func remove(_ station: Station) {
        withAnimation(.spring()) {
            favorites.removeAll { $0.villo_id == station.villo_id }
        }
    }
}

#Preview {
    FavoriteStationsView()
}
