//
//  DeleteAccountPopup.swift
//  UIRebuild
//
//  Created by admin on 18/11/2025.
//

import SwiftUI

struct DeleteAccountPopup: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation(.spring()) {
                        isPresented = false
                    }
                }
                .blur(radius: 3)
            
            VStack {
                Spacer()
                
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color.black)
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: UIScreen.main.bounds.height * 0.60
                    )
                    .overlay(
                        VStack(alignment: .leading, spacing: 24) {
                            
                            HStack(spacing: 12) {
                                Button {
                                    withAnimation(.spring()) {
                                        isPresented = false
                                    }
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
                                
                                Text("Do you really want to delete your account?")
                                    .font(AppTypography.h1)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 10)
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                            
                            
                            VStack(alignment: .leading, spacing: 12) {
                                Text("*You can unsubscribe once all outstanding payments have been made and any rented equipment has been returned.*")
                                    .font(AppTypography.p)
                                    .foregroundColor(.white.opacity(0.8))
                                
                                Text("This action will close every subscription, service, and pending claim.\nDo you confirm?")
                                    .font(AppTypography.p)
                                    .foregroundColor(.red)
                                    .padding(.top, 10)
                            }
                            .padding(.horizontal)
                            
                            Spacer()
                            
                            VStack(spacing: 18) {
                                
                                Button {
                                } label: {
                                    Text("Yes")
                                        .font(AppTypography.p.bold())
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.white)
                                        .cornerRadius(30)
                                }
                                
                                Button {
                                    withAnimation(.spring()) {
                                        isPresented = false
                                    }
                                } label: {
                                    Text("No")
                                        .font(AppTypography.p.bold())
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color(hex: "FFAE00"))
                                        .cornerRadius(30)
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.bottom, 25)
                        }
                    )
            }
            .ignoresSafeArea()
        }
    }
}
