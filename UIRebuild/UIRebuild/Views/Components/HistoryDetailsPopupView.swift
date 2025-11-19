//
//  HistoryDetailsPopupView.swift
//  UIRebuild
//
//  Created by admin on 19/11/2025.
//
//
//  HistoryDetailsPopupView.swift
//  UIRebuild
//
//  Created by admin on 19/11/2025.
//

import SwiftUI

struct HistoryDetailsPopupView: View {
    @Binding var isPresented: Bool
    
    // MOCK DATA !!
    let distance: String = "4.2 km"
    let time: String = "2h 52m"
    let plan: String = "Daily Ticket"
    
    @State private var rating: Int = 0
    
    private let horizontalPadding: CGFloat = 26
    
    var body: some View {
        ZStack {
            
            VStack {
                Spacer()
                
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color(hex: "1D1B20"))
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: UIScreen.main.bounds.height * 0.54
                    )
                    .overlay(
                        VStack(alignment: .leading, spacing: 56) {
                            
                            HStack(spacing: 22) {
                                Button {
                                    withAnimation(.spring()) { isPresented = false }
                                } label: {
                                    ZStack {
                                        Circle()
                                            .fill(Color.white)
                                            .frame(width: 34, height: 34)
                                        
                                        Image(systemName: "arrow.left")
                                            .foregroundColor(.black)
                                            .font(.system(size: 18, weight: .bold))
                                    }
                                }
                                
                                Text("Ride Details")
                                    .font(AppTypography.h1)
                                    .foregroundColor(.white)
                                
                                Spacer()
                            }
                            .padding(.horizontal, horizontalPadding)
                            .padding(.top, 40)
                            
                            
                            HStack  {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text("Distance")
                                        .font(AppTypography.h2)
                                        .foregroundColor(.white)
                                    
                                    Text(distance)
                                        .font(AppTypography.p)
                                        .foregroundColor(.white.opacity(0.8))
                                }
                                
                                .frame(width: 240, alignment: .leading)
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    Text("Time")
                                        .font(AppTypography.h2)
                                        .foregroundColor(.white)
                                    
                                    Text(time)
                                        .font(AppTypography.p)
                                        .foregroundColor(.white.opacity(0.8))
                                }
                            }
                            .padding(.horizontal, horizontalPadding)
                            
                            
                            VStack(alignment: .leading, spacing: 14) {
                                Text("How was your ride?")
                                    .font(AppTypography.h2)
                                    .foregroundColor(.white)
                                    .padding(.leading, horizontalPadding)
                                
                                HStack(spacing: 16) {
                                    Spacer()
                                    ForEach(1...5, id: \.self) { star in
                                        Image(systemName: star <= rating ? "star.fill" : "star")
                                            .font(.system(size: 30))
                                            .foregroundColor(
                                                star <= rating ?
                                                Color(hex: "FFAE00") :
                                                .white.opacity(0.3)
                                            )
                                            .onTapGesture {
                                                withAnimation(.spring()) {
                                                    rating = star
                                                }
                                            }
                                    }
                                    Spacer()
                                }
                            }
                            
                            
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Plan")
                                    .font(AppTypography.h2)
                                    .foregroundColor(.white)
                                
                                Text(plan)
                                    .font(AppTypography.p)
                                    .foregroundColor(.white.opacity(0.8))
                            }
                            .padding(.horizontal, horizontalPadding)
                            
                            
                            Spacer()
                        }
                    )
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    HistoryDetailsPopupView(isPresented: .constant(true))
}
