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
    @StateObject var menuViewModel = MenuViewModel()
    @State private var showMenu = false
    @EnvironmentObject var session: SessionManager
    
    var body: some View {
        ZStack {
            Map(
                coordinateRegion: $mapViewModel.region,
                annotationItems: mapViewModel.stations
            ) { station in
                MapMarker(
                    coordinate: station.geo_point_2d.coordinate,
                    tint: .yellow
                )
            }
            .ignoresSafeArea()
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation(.spring()) {
                            menuViewModel.isMenuOpen.toggle()
                            
                        }
                    }) {
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .frame(width: 26, height: 20)
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                Spacer()
            }
            
            VStack {
                Spacer()
                VStack (spacing: 15) {
                    
                    Button(action: {
                        mapViewModel.recenterMap()
                    }) {
                        Image(systemName: "location")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 50, height: 50)
                            .background(Color(red: 0.95, green: 0.95, blue: 0.95))

                            .clipShape(Circle())
                            .shadow(radius: 5)
                        
                    }
                    
                    Button(action: {
                        withAnimation {
                            mapViewModel.isFilterPresented = true
                        }
                    }) {
                        Image(systemName: "line.horizontal.3.decrease")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                            .padding()
                            .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    }
                }
                .padding(.bottom, 10)
                .padding(.trailing, 20)
                
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            
        
            
            if menuViewModel.isMenuOpen {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.spring) {
                            menuViewModel.isMenuOpen = false
                        }
                    }
                
                HStack {
                    Spacer()
                    
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .frame(width: UIScreen.main.bounds.width * 0.66)
                        .frame(maxHeight: .infinity)
                        .shadow(radius: 10)
                        .overlay(
                            MenuView()
                                .environmentObject(menuViewModel)
                        )
                        .transition(.move(edge: .trailing))
                }
                .ignoresSafeArea()
            }
        }
        .sheet(item: $menuViewModel.selectedDestination) { destination in
            destinationView(for: destination)
        }
        .preferredColorScheme(.dark)
    }
    @ViewBuilder
        private func destinationView(for destination: MenuDestination) -> some View {
            switch destination {
            case .profile:
                ProfileView()
            case .subscription:
                SubscriptionView()
            case .history:
                HistoryView()
            case .help:
                HelpView()
            case .settings:
                SettingsView()
            case .stationAlert:
                StationAlertView()
            }
        }
    
}

#Preview {
    MapConnectedView()
        .environmentObject(MapViewModel())
}
