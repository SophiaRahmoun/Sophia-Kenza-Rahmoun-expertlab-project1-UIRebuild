//
//  MainView.swift
//  UIRebuild
//
//  Created by admin on 20/10/2025.
//

import SwiftUI

struct MainView: View {
    @StateObject var mapViewModel = MapViewModel()

    var body: some View {
        ZStack {
            MapConnectedView()
                .environmentObject(mapViewModel)

                    if mapViewModel.isFilterPresented {
                        FilterView()
                            .environmentObject(mapViewModel)
                            .transition(.move(edge: .bottom))
                    }
                }
       
       
    }
}
