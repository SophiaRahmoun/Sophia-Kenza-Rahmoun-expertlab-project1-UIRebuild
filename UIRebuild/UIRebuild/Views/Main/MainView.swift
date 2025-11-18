//
//  MainView.swift
//  UIRebuild
//
//  Created by admin on 20/10/2025.
//

import SwiftUI

struct MainView: View {
    @StateObject var mapViewModel = MapViewModel()
    @StateObject var menuViewModel = MenuViewModel()


    var body: some View {
        ZStack {
            MapConnectedView()
                .environmentObject(mapViewModel)
                .environmentObject(menuViewModel)


                    if mapViewModel.isFilterPresented {
                        FilterView()
                            .environmentObject(mapViewModel)
                            .transition(.move(edge: .bottom))
                    }
                }
       
       
    }
}
