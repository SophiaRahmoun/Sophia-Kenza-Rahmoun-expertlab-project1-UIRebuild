//
//  StationDetailsView.swift
//  UIRebuild
//
//  Created by admin on 19/11/2025.
//

import SwiftUI
import MapKit


struct StationDetailsView: View {
    let station: Station
       
       @Environment(\.dismiss) var dismiss
       @State private var isFavorite = true
       
       @State private var region: MKCoordinateRegion
    
    private struct StationPoint: Identifiable {
           let id = UUID()
           let coordinate: CLLocationCoordinate2D
       }
       
       private var annotationItems: [StationPoint] {
           [
               StationPoint(
                   coordinate: CLLocationCoordinate2D(
                       latitude: station.geo_point_2d.lat,
                       longitude: station.geo_point_2d.lon
                   )
               )
           ]
       }
       
       init(station: Station) {
           self.station = station
           
           _region = State(initialValue:
               MKCoordinateRegion(
                   center: CLLocationCoordinate2D(
                       latitude: station.geo_point_2d.lat,
                       longitude: station.geo_point_2d.lon
                   ),
                   span: MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
               )
           )
       }
       
       // TEMP MOCK
       var electricCount: Int { Int.random(in: 0...(station.bike_stands / 2)) }
       var mechanicalCount: Int { station.bike_stands - electricCount }
       
       var body: some View {
           ZStack {
               Color.white.ignoresSafeArea()
               
               VStack(alignment: .leading, spacing: 20) {
                   
                   HStack {
                       Button {
                           dismiss()
                       } label: {
                           Image(systemName: "arrow.left")
                               .font(.system(size: 28, weight: .bold))
                               .foregroundColor(.black)
                       }
                       
                       Spacer()
                   }
                   .padding(.horizontal, 26)
                   .padding(.top, 10)
                   
                   Text(station.name_fr ?? "Unknown Station")
                       .font(AppTypography.h1)
                       .foregroundColor(.black)
                       .padding(.horizontal, 26)
                       .padding(.top, 20)
                   
                   
                   Spacer()
                   
                   ZStack(alignment: .bottomTrailing) {
                       RoundedRectangle(cornerRadius: 40)
                           .fill(Color(hex: "1D1B20"))
                           .padding(.horizontal, 20)
                           .frame(
                               maxWidth: .infinity,
                               maxHeight: UIScreen.main.bounds.height * 0.68
                           )
                           .overlay(
                               VStack(alignment: .leading, spacing: 26) {
                                   
                                   Map(
                                                                      coordinateRegion: $region,
                                                                      annotationItems: annotationItems
                                                                  ) { item in
                                                                      MapAnnotation(coordinate: item.coordinate) {
                                                                          ZStack {
                                                                              Circle()
                                                                                  .fill(Color(hex: "FFAE00"))
                                                                                  .frame(width: 22, height: 22)
                                                                              
                                                                            
                                                                          }
                                                                      }
                                                                  }
                                                                  .frame(height: UIScreen.main.bounds.height * 0.30)
                                                                  .clipShape(RoundedRectangle(cornerRadius: 40))
                                                                  .padding(.horizontal, 20)
                                   
                                   
                                   VStack(alignment: .leading, spacing: 23) {
                                       
                                       Text(station.address_fr ?? "No address available")
                                           .font(AppTypography.p)
                                           .foregroundColor(.white.opacity(0.85))
                                           .padding(.horizontal, 45)
                                       
                                       
                                       HStack(spacing: 22) {
                                           
                                           infoIconRow(
                                               icon: "bicycle",
                                               value: "\(mechanicalCount)",
                                               color: .white
                                           )
                                           
                                           infoIconRow(
                                               icon: "bolt.fill",
                                               value: "\(electricCount)",
                                               color: Color(hex: "FFAE00")
                                           )
                                           
                                           infoIconRow(
                                               icon: "parkingsign.circle.fill",
                                               value: "\(station.bike_stands)",
                                               color: .white
                                           )
                                           
                                           Spacer()
                                       }
                                       .padding(.horizontal, 45)
                                       
                                       
                                       VStack(alignment: .leading, spacing: 4) {
                                           Text("Reference")
                                               .font(AppTypography.h2)
                                               .foregroundColor(.white)
                                           
                                           Text(station.villo_id)
                                               .font(AppTypography.p)
                                               .foregroundColor(.white.opacity(0.8))
                                       }
                                       .padding(.horizontal, 45)
                                       
                                       
                                       VStack(alignment: .leading, spacing: 4) {
                                           Text("Distance from you")
                                               .font(AppTypography.h2)
                                               .foregroundColor(.white)
                                           
                                           Text("Loading…")
                                               .font(AppTypography.p)
                                               .foregroundColor(.white.opacity(0.8))
                                       }
                                       .padding(.horizontal, 45)
                                   }
                                   
                                   Spacer()
                               }
                           )
                       
                       Button {
                                          withAnimation(.spring()) {
                                              isFavorite.toggle()
                                          }
                                      } label: {
                                          Image(systemName: isFavorite ? "heart.fill" : "heart")
                                              .foregroundColor(isFavorite ? Color(hex: "FFAE00") : .gray)
                                              .font(.system(size: 30, weight: .bold))
                                              .padding(8)
                                      }
                                      .padding(.bottom, 38)
                                      .padding(.trailing, 46)
                   }
                   
                   Spacer(minLength: 20)
               }
           }
           .navigationBarBackButtonHidden(true)
       }
       
       private func infoIconRow(icon: String, value: String, color: Color) -> some View {
           HStack(spacing: 6) {
               Image(systemName: icon)
                   .font(.system(size: 22, weight: .bold))
                   .foregroundColor(color)
               
               Text(value)
                   .font(AppTypography.h2)
                   .foregroundColor(.white)
           }
       }
   }

   #Preview {
       StationDetailsView(
           station: Station(
               villo_id: "122",
               name_fr: "Test Station",
               name_nl: "Test",
               address_fr: "Rue Exemple 12",
               address_nl: nil,
               pccp: "1000",
               mu_fr: "Bruxelles",
               mu_nl: "Brussel",
               status: "OPEN",
               bike_stands: 24,
               geo_point_2d: GeoPoint(lon: 4.35, lat: 50.85)
           )
       )
   }
