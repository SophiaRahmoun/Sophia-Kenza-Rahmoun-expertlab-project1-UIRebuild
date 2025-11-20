//
//  StationReserveBikeView.swift
//  UIRebuild
//
//  Created by admin on 19/11/2025.
//

import SwiftUI

struct StationReserveBikeView: View {
    let station: Station
    @EnvironmentObject var mapViewModel: MapViewModel
    private let horizontalPadding: CGFloat = 26

    var availability: StationAvailability? {
        StationAvailability(
            number: station.villo_id,
            available_bikes: 9,
            available_bike_stands: 12,
            bike_stands: 21
        )
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            RoundedRectangle(cornerRadius: 40)
                .fill(Color(hex: "F7F2F2"))
                .frame(
                    maxWidth: .infinity,
                    maxHeight: UIScreen.main.bounds.height * 0.55
                )
                .overlay(
                    VStack(alignment: .leading, spacing: 28) {
                        
                        HStack(spacing: 18) {
                            Button {
                                withAnimation {
                                    mapViewModel.isReserveBikePresented = false
                                }
                            } label: {
                                ZStack {
                                    Circle()
                                        .fill(Color(hex: "1D1B20"))
                                        .frame(width: 34, height: 34)
                                    
                                    Image(systemName: "arrow.left")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .bold))
                                }
                            }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(station.name_fr ?? "Unknown Station")
                                    .font(AppTypography.h2)
                                    .foregroundColor(.black)
                                
                                if let a = availability {
                                    Text("\(a.available_bikes) bikes • \(a.available_bike_stands) parking")
                                        .font(AppTypography.p)
                                        .foregroundColor(.black.opacity(0.6))
                                } else {
                                    Text("Loading…")
                                        .font(AppTypography.p)
                                        .foregroundColor(.black.opacity(0.6))
                                }
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal, horizontalPadding)
                        .padding(.top, 32)
                        
                        Divider().padding(.horizontal, horizontalPadding)
                        
                        if let a = availability {
                            
                            ScrollView(showsIndicators: false) {
                                VStack(spacing: 16) {
                                    ForEach(0..<a.available_bikes, id: \.self) { _ in

                                                                           let isElectric = Bool.random()

                                                                           HStack(spacing: 20) {

                                                                               Image(systemName: isElectric ? "bolt.fill" : "bicycle")
                                                                                   .foregroundColor(Color(hex: "FFAE00"))
                                                                                   .font(.system(size: 22))

                                                                               Text(isElectric ? "Electric Bike" : "Mechanical Bike")
                                                                                   .font(AppTypography.h3)
                                                                                   .foregroundColor(.black)

                                                                               Spacer()

                                                                               Button {
                                                                                   print("Choose bike!")
                                                                               } label: {
                                                                                   Text("Choose this bike")
                                                                                       .font(AppTypography.p.bold())
                                                                                       .foregroundColor(.white)
                                                                                       .padding(.vertical, 10)
                                                                                       .padding(.horizontal, 18)
                                                                                       .background(Color.black)
                                                                                       .cornerRadius(20)
                                                                               }
                                                                           }
                                                                           .padding(.horizontal, horizontalPadding)
                                                                       }

                                                                     
                                                                       if a.available_bikes == 0 {
                                                                           VStack(spacing: 20) {
                                                                               Text("No bikes available")
                                                                                   .font(AppTypography.h3)
                                                                                   .foregroundColor(.black.opacity(0.6))

                                                                               Button {
                                                                                   print("Park here")
                                                                               } label: {
                                                                                   Text("Park bike here")
                                                                                       .font(AppTypography.h2)
                                                                                       .foregroundColor(.white)
                                                                                       .padding()
                                                                                       .frame(maxWidth: .infinity)
                                                                                       .background(Color.black)
                                                                                       .cornerRadius(24)
                                                                               }
                                                                               .padding(.horizontal, horizontalPadding)
                                                                           }
                                                                       }
                                                                   }
                                                               }

                                                           } else {
                                                               ProgressView()
                                                                   .padding()
                                                           }

                                                           Spacer(minLength: 20)
                                                       }
                                                   )
                                           }
                                           .ignoresSafeArea()
                                       }
                                   }
#Preview {
    let mockStation = Station(
        villo_id: "001",
        name_fr: "Paola",
        name_nl: "Paola",
        address_fr: nil,
        address_nl: nil,
        pccp: "1180",
        mu_fr: "Uccle",
        mu_nl: "Ukkel",
        status: "OPEN",
        bike_stands: 20,
        geo_point_2d: GeoPoint(lon: 4.326985, lat: 50.80037704)
    )

    StationReserveBikeView(station: mockStation)
        .environmentObject(MapViewModel())
}
