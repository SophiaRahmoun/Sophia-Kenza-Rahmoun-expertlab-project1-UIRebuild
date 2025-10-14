//
//  Colors.swift
//  UIRebuild
//
//  Created by admin on 14/10/2025.
//

import SwiftUI

struct AppButton: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(AppTypography.h3.weight(.bold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.appYellow)
                .cornerRadius(29)
        }
        .buttonStyle(.plain)
    }
}
