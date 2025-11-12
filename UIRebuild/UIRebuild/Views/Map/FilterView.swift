//
//  FilterView.swift
//  UIRebuild
//
//  Created by admin on 10/11/2025.
//

import SwiftUI

struct FilterView: View {
    @EnvironmentObject var mapViewModel: MapViewModel

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button(action: {
                    withAnimation {
                        mapViewModel.isFilterPresented = false
                    }
                }) {
                    Image(systemName: "chevron.down")
                        .font(.title2)
                        .padding()
                }
                Spacer()
            }

            Text("Filter")
                .font(.largeTitle)
                .bold()

            ForEach(FilterOption.allCases) { option in
                Button(action: {
                    mapViewModel.selectedFilter = option
                    mapViewModel.isFilterPresented = false
                    // TODO: Future logic to apply filter on map
                }) {
                    Text(option.rawValue)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(mapViewModel.selectedFilter == option ? Color.yellow : Color.gray.opacity(0.2))
                        .foregroundColor(.black)
                        .cornerRadius(12)
                }
            }

            Spacer()
        }
        .padding()
        .frame(maxHeight: UIScreen.main.bounds.height / 2)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 10)
        .padding()
    }
}

#Preview {
    FilterView()
}
