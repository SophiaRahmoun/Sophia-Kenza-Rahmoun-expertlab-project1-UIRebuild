//
//  StationAlertView.swift
//  UIRebuild
//
//  Created by admin on 18/11/2025.
//

import SwiftUI

struct StationAlertView: View {
    @Environment(\.dismiss) var dismiss
       
       var body: some View {
           NavigationStack {
               ZStack {
                   Color.white.ignoresSafeArea()
                   
                   VStack(alignment: .leading, spacing: 40) {
                       
                       HStack {
                           Button {
                               dismiss()
                           } label: {
                               Image(systemName: "xmark")
                                   .foregroundColor(.black)
                                   .font(.system(size: 30, weight: .bold))
                           }
                           Spacer()
                       }
                       .padding(.horizontal, 26)
                       .padding(.top, 20)
                       
                       
                       
                       Text("Station Alerts")
                           .font(AppTypography.h1)
                           .foregroundColor(.black)
                           .padding(.horizontal, 26)
                           .padding(.top, 85)

                       
                       
                       VStack(alignment: .leading, spacing: 14) {
                           
                           Text("Bourse")
                               .font(AppTypography.h2)
                               .foregroundColor(.black)
                           
                           Text("Station closed until the end of 2025 due to works")
                               .font(AppTypography.p)
                               .foregroundColor(.black.opacity(0.6))
                               .fixedSize(horizontal: false, vertical: true)
                           
                           Divider()
                               .background(Color.black.opacity(0.15))
                           
                       }
                       .padding(.horizontal, 45)

                       Spacer()
                   }
               }
           }
           .navigationBarBackButtonHidden(true)
       }
   }

   #Preview {
       StationAlertView()
   }
