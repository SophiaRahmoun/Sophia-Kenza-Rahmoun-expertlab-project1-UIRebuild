//
//  ChooseSubscriptionView.swift
//  UIRebuild
//
//  Created by admin on 21/11/2025.
//


import SwiftUI

struct ChooseSubscriptionView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = ChooseSubscriptionViewModel()
    
    @GestureState private var dragOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 28) {
                
                HStack {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .font(.system(size: 28, weight: .bold))
                            .padding(10)
                    }
                    Spacer()
                }
                .padding(.horizontal, 26)
                .padding(.top, 20)
                
                
                Text("Subscriptions")
                    .font(AppTypography.h1)
                    .foregroundColor(.black)
                    .padding(.horizontal, 36)
                    .padding(.top, 20)
                
                
                HStack {
                    
                    Button { viewModel.previous() } label: {
                        Image(systemName: "arrow.left")
                            .foregroundColor(viewModel.currentIndex == 0 ? .gray.opacity(0.3) : .black)
                            .font(.system(size: 22, weight: .bold))
                            .frame(width: 50, height: 50)
                    }
                    .disabled(viewModel.currentIndex == 0)
                    
                    Spacer()
                    
                    HStack(spacing: 11) {
                        ForEach(0..<viewModel.plans.count, id: \.self) { i in
                            Circle()
                                .fill(i == viewModel.currentIndex ? Color(hex: "FFAE00") : .gray.opacity(0.3))
                                .frame(width: 10, height: 10)
                        }
                    }
                    
                    Spacer()
                    
                    Button { viewModel.next() } label: {
                        Image(systemName: "arrow.right")
                            .foregroundColor(viewModel.currentIndex == viewModel.plans.count - 1 ? .gray.opacity(0.3) : .black)
                            .font(.system(size: 22, weight: .bold))
                            .frame(width: 50, height: 50)
                    }
                    .disabled(viewModel.currentIndex == viewModel.plans.count - 1)
                    
                }
                .padding(.horizontal, 26)
                
                
                GeometryReader { geo in
                    let cardWidth = geo.size.width * 0.75
                    let spacing: CGFloat = 25
                    let leftPadding = (geo.size.width - cardWidth) / 2
                    
                    
                    HStack(spacing: spacing) {
                        ForEach(Array(viewModel.plans.enumerated()), id: \.offset) { index, plan in
                            
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(hex: "F7F2F2"))
                                .frame(
                                    width: cardWidth,
                                    height: geo.size.height * 0.98
                                )
                                .shadow(color: .black.opacity(0.1), radius: 6)
                                .overlay(
                                    Text(plan.name)
                                        .font(AppTypography.h2)
                                        .foregroundColor(.black)
                                )
                                .animation(.spring(), value: viewModel.currentIndex)
                        }
                    }
                    .padding(.leading, leftPadding)
                    .offset(x:
                        -CGFloat(viewModel.currentIndex) * (cardWidth + spacing)
                        + dragOffset
                    )
                    .gesture(
                        DragGesture()
                            .updating($dragOffset) { value, output, _ in
                                output = value.translation.width
                            }
                            .onEnded { value in
                                let threshold = cardWidth / 3
                                
                                if value.translation.width < -threshold,
                                   viewModel.currentIndex < viewModel.plans.count - 1 {
                                    viewModel.next()
                                } else if value.translation.width > threshold,
                                          viewModel.currentIndex > 0 {
                                    viewModel.previous()
                                }
                            }
                    )
                    
                }
                .frame(height: 380)
                
                Spacer()
            }
        }
    }
}

#Preview {
    ChooseSubscriptionView()
}
