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
        VStack(alignment: .leading, spacing: 20) {
            Text("Menu")
                .font(AppTypography.h1)
                .padding(.top, 40)
                .padding(.horizontal)

            VStack(alignment: .leading, spacing: 25) {
                menuButton("My Profile", destination: .profile)
                menuButton("My Villo Pass", destination: .subscription)
                menuButton("History", destination: .history)
                menuButton("Help", destination: .help)
                menuButton("Settings", destination: .settings)
                menuButton("Station Alerts", destination: .stationAlert)
            }
            .font(AppTypography.h3)
            .foregroundColor(.black)
            .padding(.horizontal)

            Spacer()
        }
        .background(Color.white)
    }

    private func menuButton(_ title: String, destination: MenuDestination) -> some View {
        Button(action: {
            menuViewModel.selectedDestination = destination
            withAnimation(.spring()) {
                menuViewModel.isMenuOpen = false
            }
        }) {
            Text(title)
        }
    }
}

#Preview {
    MapConnectedView()
        .environmentObject(MapViewModel())
        .environmentObject(MenuViewModel())
}
