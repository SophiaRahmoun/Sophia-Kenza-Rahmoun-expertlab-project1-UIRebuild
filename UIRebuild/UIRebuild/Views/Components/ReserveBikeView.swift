//
//  ReserveBikeView.swift
//  UIRebuild
//
//  Created by admin on 20/11/2025.
//

import SwiftUI

struct ReserveBikeView: View {
    
    let bikeType: BikeType
    let station: Station

    @EnvironmentObject var mapViewModel: MapViewModel
    
    private let horizontalPadding: CGFloat = 42
    
    @State private var randomStars: Int = Int.random(in: 2...5)
    @State private var lastReviewDays: Int = Int.random(in: 1...14)
    @State private var bikeNumber: Int = Int.random(in: 1...2000)

    var body: some View {
        VStack {
            Spacer()
            Color.black.opacity(0.001)
                           .onTapGesture {
                               withAnimation(.spring()) {
                                   mapViewModel.isBikeReservationPresented = false
                                   mapViewModel.isReserveBikePresented = true
                                   mapViewModel.selectedBikeType = nil   
                               }
                           }
            
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.white)
                .frame(maxWidth: .infinity,
                       maxHeight: UIScreen.main.bounds.height * 0.75)
                .shadow(color: .black.opacity(0.1), radius: 8)
                .overlay(
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        HStack(spacing: 22) {
                            Button {
                                withAnimation(.spring()) {
                                    mapViewModel.isBikeReservationPresented = false
                                    mapViewModel.isReserveBikePresented = true
                                }
                            } label: {
                                ZStack {
                                    Circle()
                                        .fill(Color(hex: "1D1B20"))
                                        .frame(width: 36, height: 36)

                                    Image(systemName: "arrow.left")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .bold))
                                }
                            }
                            
                            HStack(spacing: 12) {
                                Image(systemName: bikeType == .electric ? "bolt.fill" : "bicycle")
                                    .foregroundColor(Color(hex: "FFAE00"))
                                    .font(.system(size: 26))
                                
                                Text("Rent this bike")
                                    .font(AppTypography.h1)
                                    .foregroundColor(.black)
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal, horizontalPadding)
                        .padding(.top, 35)
                        
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Bike Type")
                                    .font(AppTypography.h2)
                                    .foregroundColor(.black)
                                
                                Text(bikeType == .electric ? "Electric" : "Mechanical")
                                    .font(AppTypography.p)
                                    .foregroundColor(.black.opacity(0.75))
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Station")
                                    .font(AppTypography.h2)
                                    .foregroundColor(.black)
                                
                                Text(station.name_fr ?? "Unknown")
                                    .font(AppTypography.p)
                                    .foregroundColor(.black.opacity(0.75))
                            }
                        }
                        .padding(.horizontal, horizontalPadding)
                        
                        
                        //
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Reviews")
                                .font(AppTypography.h2)
                                .foregroundColor(.black)
                            
                            HStack(spacing: 8) {
                                ForEach(1...5, id: \.self) { i in
                                    Image(systemName: i <= randomStars ? "star.fill" : "star")
                                        .foregroundColor(i <= randomStars ? Color(hex: "FFAE00") : .gray.opacity(0.3))
                                        .font(.system(size: 20))
                                }
                            }
                            
                            Text("Last reviewed: \(lastReviewDays) days ago")
                                .font(AppTypography.p)
                                .foregroundColor(.black.opacity(0.55))
                        }
                        .padding(.horizontal, horizontalPadding)
                        
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Reference")
                                    .font(AppTypography.h2)
                                    .foregroundColor(.black)
                                
                                Text(station.villo_id)
                                    .font(AppTypography.p)
                                    .foregroundColor(.black.opacity(0.8))
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Bike Number")
                                    .font(AppTypography.h2)
                                    .foregroundColor(.black)
                                
                                Text("\(bikeNumber)")
                                    .font(AppTypography.p)
                                    .foregroundColor(.black.opacity(0.8))
                            }
                        }
                        .padding(.horizontal, horizontalPadding)
                        
                        
                        Spacer()
                    }
                )
        }
        .ignoresSafeArea()
    }
}

#Preview {
    let mockStation = Station(
        villo_id: "122",
        name_fr: "Test Station",
        name_nl: "Test NL",
        address_fr: "Rue Exemple 54",
        address_nl: "Voorbeeldstraat 54",
        pccp: "1000",
        mu_fr: "Bruxelles",
        mu_nl: "Brussel",
        status: "OPEN",
        bike_stands: 24,
        geo_point_2d: GeoPoint(
            lon: 4.35,
            lat: 50.85
        )
    )
    
    ReserveBikeView(
        bikeType: .electric,
        station: mockStation
    )
    .environmentObject(MapViewModel())
}
