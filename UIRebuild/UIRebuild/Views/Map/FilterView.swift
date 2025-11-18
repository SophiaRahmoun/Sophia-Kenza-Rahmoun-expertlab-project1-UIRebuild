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
        VStack {
            Spacer()
            RoundedRectangle(cornerRadius: 40)
                           .fill(Color.white)
                           .frame(
                               maxWidth: .infinity,
                               maxHeight: UIScreen.main.bounds.height / 3 
                           )
                           .overlay(
                               VStack(spacing: 20) {
                                   HStack (spacing: 12) {
                                       Button(action: {
                                           withAnimation {
                                               mapViewModel.isFilterPresented = false
                                           }
                                       }) {
                                           ZStack {
                                               Circle()
                                                   .fill(Color.black)
                                                   .frame(width: 30, height: 30)
                                               Image(systemName: "arrow.left")
                                                   .foregroundColor(.white)
                                                   .font(.system(size: 18, weight: .bold))
                                           }
                                       }
                                       .padding(.leading)
                                               Text("Filter")
                                                   .bold()
                                                   .font(AppTypography.h1)
                                                   .padding()
                                                   .foregroundColor(.black)
                                         
                                       Spacer()
                                   }

                                   ForEach(FilterOption.allCases) { option in
                                       Button {
                                           mapViewModel.toggleFilter(option)
                                       } label: {
                                           HStack(spacing: 40) {
                                               RoundedRectangle(cornerRadius: 3)
                                                   .stroke(Color.black, lineWidth: 1)
                                                   .background(
                                                       RoundedRectangle(cornerRadius: 3)
                                                           .fill(
                                                               mapViewModel.selectedFilters.contains(option)
                                                               ? Color.yellow
                                                               : Color.white
                                                           )
                                                   )
                                                   .frame(width: 14, height: 14)

                                               Text(option.rawValue)
                                                   .foregroundColor(.black)
                                                   .font(.body)

                                               Spacer()
                                           }
                                           .padding(.horizontal, 20)
                                       }
                                   }
                                   Spacer()
                               }
                               .padding()
                           )
                   }
                   .ignoresSafeArea()
               }
    
           }

#Preview {
    FilterView()
        .environmentObject(MapViewModel())
}
