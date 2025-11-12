//
//  MainMapView.swift
//  UIRebuild
//
//  Created by admin on 20/10/2025.
//

import SwiftUI
import MapKit

struct MainMapView: View {
    @State private var showLogin = false
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 50.8503, longitude: 4.3517),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    var body: some View {
        ZStack {
            Map(coordinateRegion: $region)
                .ignoresSafeArea()

            VStack {
                HStack {
                    Spacer()
                    Text("2 Bikes around you")
                        .font(AppTypography.h2)
                        .foregroundColor(Color(red: 247/255, green: 242/255, blue: 242/255))
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                    Spacer()

                    Button(action: {
                    }) {
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color(red: 247/255, green: 242/255, blue: 242/255))
                    }
                    .padding(.top, 20)
                    .padding(.trailing, 20)
                }
                Spacer()
            }

            VStack {
                Spacer()
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color(red: 247/255, green: 242/255, blue: 242/255))
                    .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 5)
                    .overlay(
                        VStack {
                            Text("Become Villo'er")
                                .foregroundColor(.black)
                                .font(AppTypography.h2)
                            Button(action: {
                                showLogin = true
                            }) {
                                Text("Log In")
                                    .foregroundColor(.black)
                                    .padding()
                                    .frame(maxWidth: 200)
                                    .background(Color.yellow)
                                    .cornerRadius(30)
                            }
                            .sheet(isPresented: $showLogin) {
                                LoginView()
                            }
                        }
                    )
            }
            .ignoresSafeArea()
        }
        .preferredColorScheme(.dark)

    }
}

#Preview {
    MainMapView()
}

