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

            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 30) {
                    
                    HStack(spacing: 30) {
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
                            .fixedSize(horizontal: false, vertical: true)

                        Spacer()
                    }
                    .padding(.horizontal)

                    VStack(alignment: .leading, spacing: 14) {
                        Text("*You can unsubscribe once all outstanding payments have been made and any rented equipment has been returned.*")
                            .font(AppTypography.p)
                            .foregroundColor(.white.opacity(0.75))
                            .fixedSize(horizontal: false, vertical: true)

                        Text("This action will close every subscription, service, and pending claim.\nDo you confirm?")
                            .font(AppTypography.p)
                            .foregroundColor(.red)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)

                    Spacer().frame(height: 20)
                    
                    VStack(spacing: 22) {
                        
                        Button {
                            SessionManager.shared.logout()
                                isPresented = false                        } label: {
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
                .padding(.top, 25)
                .frame(
                    maxWidth: .infinity,
                    maxHeight: UIScreen.main.bounds.height * 0.63
                )
                .background(Color(hex: "1D1B20"))
                .clipShape(RoundedRectangle(cornerRadius: 40))
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    HelpView()
}
