//
//  SettingsView.swift
//  UIRebuild
//
//  Created by admin on 18/11/2025.
//

import SwiftUI
import UserNotifications


struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var sessionManager: SessionManager
    
    @State private var notificationsEnabled = false
    @State private var newUsername: String = ""
    
    @State private var showDeletePopup = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 40) {
                    
                    HStack {
                        Button { dismiss() } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 30, weight: .bold))
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 26)
                    .padding(.top, 20)
                    
                    
                    Text("Settings")
                        .font(AppTypography.h1)
                        .foregroundColor(.black)
                        .padding(.horizontal, 26)
                        .padding(.top, 60)

                    
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        HStack(spacing: 14) {
                            Image(systemName: "bell")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                            
                            Text("Notifications")
                                .font(AppTypography.h3)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Toggle("", isOn: $notificationsEnabled)
                                .labelsHidden()
                                .onChange(of: notificationsEnabled) { newValue in
                                    handleNotificationToggle(isOn: newValue)
                                }
                        }
                        
                        Divider()
                            .background(Color.black.opacity(0.15))
                    }
                    .padding(.horizontal, 26)
                    .padding(.top, 67)
                    
                    
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text("Change Username")
                            .font(AppTypography.h3)
                            .foregroundColor(.black)
                        
                        Text("Current: \(sessionManager.currentUser?.username ?? "Unknown")")
                            .font(AppTypography.p)
                            .foregroundColor(.black.opacity(0.5))
                        
                        TextField("Enter new username", text: $newUsername)
                            .font(AppTypography.p)
                            .padding()
                            .background(Color.gray.opacity(0.12))
                            .cornerRadius(12)
                            .foregroundColor(.black)
                        
                        Divider()
                            .background(Color.black.opacity(0.15))
                    }
                    .padding(.horizontal, 26)
                    
                    
                    VStack(spacing: 22) {
                        
                        Button {
                            showDeletePopup = true
                        } label: {
                            Text("Delete my account")
                                .font(AppTypography.h3)
                                .foregroundColor(.red)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        Button {
                            sessionManager.logout()
                        } label: {
                            Text("Log out")
                                .font(AppTypography.h3)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .padding(.horizontal, 26)
                    
                    
                    Spacer()
                }
            }
        }
        .sheet(isPresented: $showDeletePopup) {
            DeleteAccountPopup(isPresented: $showDeletePopup)
                .presentationDetents([.medium])
        }
        .navigationBarBackButtonHidden(true)
    }
    
    
    private func handleNotificationToggle(isOn: Bool) {
        if isOn {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, _ in
                DispatchQueue.main.async {
                    notificationsEnabled = granted
                }
            }
        } else {
            notificationsEnabled = false
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(SessionManager.shared)
}
