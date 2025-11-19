//
//  HelpView.swift
//  UIRebuild
//
//  Created by admin on 18/11/2025.
//

import SwiftUI

struct HelpView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showReportInfo = false
    @State private var showDeletePopup = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 32) {
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                    }
                    .padding(.top, 20)
                    .padding(.leading, 20)
                    
                    
                    Text("Support")
                        .font(AppTypography.h1)
                        .foregroundColor(.black)
                        .padding(.horizontal, 20)
                        .padding(.top, 100)
                    
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Button {
                            withAnimation(.spring()) {
                                showReportInfo.toggle()
                            }
                        } label: {
                            HStack(spacing: 14) {
                                Image(systemName: "questionmark.circle")
                                    .font(.system(size: 22))
                                    .foregroundColor(.black)
                                
                                Text("Report a defective bike")
                                    .font(AppTypography.h3)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Image(systemName: showReportInfo ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.black.opacity(0.7))
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                        }
                        
                        if showReportInfo {
                            Text("You can contact villo@brussels.be to report a defective bike.")
                                .font(AppTypography.p)
                                .foregroundColor(.black.opacity(0.8))
                                .padding(.horizontal, 34)
                                .padding(.bottom, 8)
                                .transition(.opacity)
                        }
                    }
                    .padding(.top, 20)
                    
                    
                    Spacer()
                    
                    VStack(spacing: 25) {
                        
                        Button {
                            withAnimation(.spring()) {
                                showDeletePopup = true
                            }
                        } label: {
                            HStack {
                                Image(systemName: "trash")
                                    .font(.system(size: 20))
                                    .foregroundColor(Color.red)
                                
                                Text("Delete Account")
                                    .font(AppTypography.h3)
                                    .foregroundColor(.red)
                                
                                Spacer()
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.red.opacity(0.1))
                            .cornerRadius(12)
                        }
                        
                        Button {
                        } label: {
                            HStack {
                                Image(systemName: "rectangle.portrait.and.arrow.right")
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                
                                Text("Log Out")
                                    .font(AppTypography.h3)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(12)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
                    
                }
            }
        }
        .blur(radius: showDeletePopup ? 8 : 0)
        .overlay(
            Group {
                if showDeletePopup {
                    DeleteAccountPopup(isPresented: $showDeletePopup)
                }
            }
        )
    }
}

       #Preview {
           HelpView()
       }
