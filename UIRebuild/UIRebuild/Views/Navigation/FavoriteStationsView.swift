//
//  FavoriteStationsView.swift
//  UIRebuild
//
//  Created by admin on 19/11/2025.
//


import SwiftUI

struct FavoriteStationsView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()

                VStack {
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .bold))
                        }
                        .padding(.leading, 20)
                        .padding(.top, 20)

                        Spacer()
                    }

                    Text("Favorite Stations")
                        .font(AppTypography.h1)
                        .foregroundColor(.black)
                        .padding(.top, 40)

                    Spacer()

                    Text("Coming soon...")
                        .foregroundColor(.gray)
                        .padding(.bottom, 50)

                    Spacer()
                }
            }
        }
    }
}

#Preview {
    FavoriteStationsView()
}
