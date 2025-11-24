//
//  PaymentMethodView.swift
//  UIRebuild
//
//  Created by admin on 19/11/2025.
//

import SwiftUI


import SwiftUI

struct PaymentMethodView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedMethod: PaymentOption? = nil
    let selectedPlan: SubscriptionPlan
    
    private let horizontalPadding: CGFloat = 28
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 28) {
                
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.black)
                            .font(.system(size: 26, weight: .bold))
                    }
                    Spacer()
                }
                .padding(.horizontal, horizontalPadding)
                .padding(.top, 20)
                
                Text("Payment method")
                    .font(AppTypography.h1)
                    .foregroundColor(.black)
                    .padding(.horizontal, horizontalPadding)
                    .padding(.top, 60)

                Spacer()

                RoundedRectangle(cornerRadius: 35)
                    .fill(Color(hex: "1D1B20"))
                    .shadow(color: .gray.opacity(0.2), radius: 8)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .overlay(
                        VStack(alignment: .leading, spacing: 22) {
                            
                            Text("How would you like to pay?")
                                .font(AppTypography.h2)
                                .foregroundColor(.white)
                                .padding(.bottom, 34)

                            VStack(spacing: 22) {
                                paymentMethodRow(.mastercard, icon: "creditcard")
                                paymentMethodRow(.bancontact, icon: "banknote")
                                paymentMethodRow(.visa, icon: "creditcard.fill")
                            }
                            
                            HStack {
                                Spacer()
                                Text("Total charge:")
                                    .font(AppTypography.p)
                                    .foregroundColor(.white.opacity(0.7))
                                Spacer()

                                Text("EUR 21,00")
                                    .font(AppTypography.p.bold())
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .padding(.top, 67)

                            HStack {
                                Spacer()
                                Button {
                                    print("Proceeding with:", selectedMethod?.rawValue ?? "None")
                                } label: {
                                    Text("Proceed to Payment")
                                        .font(AppTypography.h3.bold())
                                        .foregroundColor(.black)
                                        .padding(.vertical, 12)
                                        .frame(width: UIScreen.main.bounds.width * 0.7)
                                        .background(Color(hex: "FFAE00"))
                                        .cornerRadius(50)
                                }
                                Spacer()
                            }
                        }
                        .padding(.top, 30)
                        .padding(.horizontal, horizontalPadding)
                        .padding(.bottom, 20) // ajout pour espacement final
                    )
            }
        }
    }
    
    @ViewBuilder
    private func paymentMethodRow(_ method: PaymentOption, icon: String) -> some View {
        Button {
            selectedMethod = method
        } label: {
            HStack(spacing: 16) {
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.black, lineWidth: 1)
                    .background(
                        RoundedRectangle(cornerRadius: 1)
                            .fill(selectedMethod == method ? Color(hex: "FFAE00") : Color.white)
                    )
                    .frame(width: 16, height: 16)
                
                Image(systemName: icon)
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                
                Text(method.rawValue)
                    .foregroundColor(.white) // ✅ Fix ici
                    .font(AppTypography.h3)
                
                Spacer()
            }
        }
    }
}

enum PaymentOption: String, CaseIterable, Identifiable {
    case mastercard = "Mastercard"
    case bancontact = "Bancontact"
    case visa = "Visa"
    
    var id: String { self.rawValue }
}


#Preview {
    let dummyPlan = SubscriptionPlan(name: "Monthly", price: "9.99", priceSuffix: "/month", description: "Unlimited rides", allowsQuantity: false)
    PaymentMethodView(selectedPlan: dummyPlan)
}

