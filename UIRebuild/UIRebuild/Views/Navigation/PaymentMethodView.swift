//
//  PaymentMethodView.swift
//  UIRebuild
//
//  Created by admin on 19/11/2025.
//

import SwiftUI

struct PaymentMethodView: View {
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            Text("Payment Method")
                .font(AppTypography.h1)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    PaymentMethodView()
}
