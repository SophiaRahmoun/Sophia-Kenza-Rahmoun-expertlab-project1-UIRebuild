//
//  MySubscriptionView.swift
//  UIRebuild
//
//  Created by admin on 21/11/2025.
//

import SwiftUI


struct MySubscriptionView: View {
    @State private var goToChooseSubscription = false
    
    @Environment(\.dismiss) var dismiss
    
    // TEMP MOCK DATA (will b replaced by backend)
    @State private var startDate: String = "12 Nov 2025"
    @State private var planType: String = "Monthly"
    @State private var paymentMethod: String = "Visa •••• 6529"
    
    private let horizontalPadding: CGFloat = 32
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                Color.white.ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 87) {
                    
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.black)
                        }
                        Spacer()
                    }
                    .padding(.horizontal, horizontalPadding)
                    .padding(.top, 20)
                    
                    
                    Text("My Subscription")
                        .font(AppTypography.h1)
                        .foregroundColor(.black)
                        .padding(.horizontal, horizontalPadding)
                        .padding(.top, 50)
                    
                    
                    HStack(spacing: 35) {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Started on")
                                .font(AppTypography.h2)
                                .foregroundColor(.black)
                            
                            Text(startDate)
                                .font(AppTypography.p)
                                .foregroundColor(.black.opacity(0.7))
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Plan type")
                                .font(AppTypography.h2)
                                .foregroundColor(.black)
                            
                            Text(planType)
                                .font(AppTypography.p)
                                .foregroundColor(.black.opacity(0.7))
                        }
                    }
                    .padding(.horizontal, horizontalPadding)
                    
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Payment method")
                            .font(AppTypography.h2)
                            .foregroundColor(.black)
                        
                        Text(paymentMethod)
                            .font(AppTypography.p)
                            .foregroundColor(.black.opacity(0.7))
                    }
                    .padding(.horizontal, horizontalPadding)
                    
                    
                    Spacer()
                    
                    Button {
                        goToChooseSubscription = true
                        
                    } label: {
                        Text("Change My Plan")
                            .font(AppTypography.h3.bold())
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .frame(width: UIScreen.main.bounds.width * 0.7)
                            .background(Color(hex: "FFAE00"))
                            .cornerRadius(50)
                    }
                    .padding(.horizontal, horizontalPadding)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 40)
                    
                }
            }
        }
        .sheet(isPresented: $goToChooseSubscription) {
            ChooseSubscriptionView()
        
        }
      
    }
}

#Preview {
    MySubscriptionView()
}
