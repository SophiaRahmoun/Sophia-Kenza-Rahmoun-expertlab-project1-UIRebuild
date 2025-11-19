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
    
    @State private var favorites: [FavoriteStation] = [
        FavoriteStation(name: "Agora", address: "Agoraplein 120"),
        FavoriteStation(name: "Gare Centrale", address: "Keizerlaan 16"),
        FavoriteStation(name: "Beekkant", address: "Boulevard Edmond Machtens"),
        FavoriteStation(name: "Artan", address: "Rue Clays"),
    ]
    
    @State private var selectedStation: FavoriteStation? = nil
    
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 30) {
                    
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
                        .padding(.top, 80)

                    
                        .navigationDestination(isPresented: $navigateToStationDetails) {
                            if let station = selectedStation {
                                StationDetailsView(station: station)
                            }
                        }
                    
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 15) {
                            ForEach(favorites) { station in
                                stationCard(station)
                            }
                        }
                        .padding(.horizontal, 26)
                        .padding(.top, 40)
                    }
                }
            }
        }
    }
    
    
    private func stationCard(_ station: FavoriteStation) -> some View {
        Button {
            selectedStation = station
            navigateToStationDetails = true

        } label: {
            ZStack(alignment: .topLeading) {
                
                RoundedRectangle(cornerRadius: 22)
                    .fill(Color(hex: "1D1B20"))
                    .frame(height: 160)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(station.name)
                        .font(AppTypography.h2)
                        .foregroundColor(.white)
                        .padding(.top, 22)
                    
                    Text(station.address)
                        .font(AppTypography.p)
                        .foregroundColor(.white.opacity(0.8))
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 16)
                
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            remove(station: station)
                        } label: {
                            Image(systemName: "heart.fill")
                                .foregroundColor(Color(hex: "FFAE00"))
                                .font(.system(size: 26))
                                .padding(10)
                        }
                    }
                }
                .padding(12)
            }
        }
        .buttonStyle(.plain)
    }
    
    
    private func remove(station: FavoriteStation) {
        withAnimation(.spring()) {
            favorites.removeAll { $0.id == station.id }
        }
    }
}

struct FavoriteStation: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let address: String
}

#Preview {
    FavoriteStationsView()
}
