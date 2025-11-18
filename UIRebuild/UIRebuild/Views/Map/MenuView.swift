//
//  menuView.swift
//  UIRebuild
//
//  Created by admin on 17/11/2025.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var menuViewModel: MenuViewModel


    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Image("villo logo")
                           .resizable()
                           .scaledToFit()
                           .frame(width: 100)
                           .padding(.top,
                                    120)
                           .padding(.horizontal, 15)
            
            HStack(spacing: 16) {
                           statCard(
                               icon: "map",
                               value: "54",
                               label: "kilometers"
                           )

                           statCard(
                               icon: "bicycle",
                               value: "6",
                               label: "rides"
                           )
                       }
            .padding(.top, 40)
            .padding(.horizontal, 6)
            
            VStack(alignment: .leading, spacing: 25) {
                menuButton("My Profile", icon: "person", destination: .profile)
                menuButton("Subscription", icon: "medal", destination: .subscription)
                menuButton("History", icon: "clock.arrow.circlepath", destination: .history)
                menuButton("Help",  icon: "questionmark.circle", destination: .help)
                menuButton("Settings", icon: "gearshape", destination: .settings)
                menuButton("Station Alerts", icon: "newspaper", destination: .stationAlert)
            }
            .padding(.horizontal, 4)
                    .padding(.trailing, 16)
            .font(AppTypography.h3)
            .foregroundColor(.black)
            .padding(.horizontal)

            Spacer()
        }
        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
    }
    private func statCard(icon: String, value: String, label: String) -> some View {
          VStack(alignment: .leading, spacing: 6) {

              Image(systemName: icon)
                  .font(.system(size: 25, weight: .semibold))
                  .foregroundColor(Color(hex: "FFAE00"))

              VStack(alignment: .leading, spacing: 0) {
                  Text(value)
                      .font(AppTypography.h3)
                      .fontWeight(.bold)
                      .foregroundColor(.black)

                  Text(label)
                      .font(AppTypography.p)
                      .foregroundColor(.black.opacity(0.75))
              }
          }
          .padding(.vertical, 10)
          .padding(.horizontal, 14)
          .cornerRadius(16)
      }
    
    private func menuButton(_ title: String, icon: String, destination: MenuDestination) -> some View {
        Button(action: {
            menuViewModel.selectedDestination = destination
            withAnimation(.spring()) {
                menuViewModel.isMenuOpen = false
            }
        }) {
            HStack(spacing: 16) {
                         Image(systemName: icon)
                             .font(.system(size: 22))
                             .foregroundColor(.black)

                         Text(title)
                             .foregroundColor(.black)
                             .font(AppTypography.h3)

                         Spacer()
                Image(systemName: "chevron.right")
                                  .font(.system(size: 20))
                                  .foregroundColor(.black.opacity(0.6))
                                  .padding(.trailing, 4)
                     }
                     .padding(.vertical, 6)
        }
    }
}

#Preview {
    MapConnectedView()
        .environmentObject(MapViewModel())
        .environmentObject(MenuViewModel())
}
