//
//  HistoryView.swift
//  UIRebuild
//
//  Created by admin on 18/11/2025.
//

import SwiftUI

struct HistoryDay: Identifiable {
    let id = UUID()
    let dateString: String
}

struct HistoryView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedDay: HistoryDay?
    @State private var showDetailsPopup = false

    let monthTitle = "August 2025"
    let days = [
        HistoryDay(dateString: "7 August 2025"),
        HistoryDay(dateString: "12 August 2025"),
        HistoryDay(dateString: "18 August 2025"),
        HistoryDay(dateString: "23 August 2025")
    ]
    
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

                    Text("History")
                        .font(AppTypography.h1)
                        .foregroundColor(.black)
                        .padding(.horizontal, 20)
                        .padding(.top, 80)

                    VStack(alignment: .leading, spacing: 12) {

                        Text(monthTitle)
                            .font(AppTypography.h2.bold())
                            .foregroundColor(.black)
                            .padding(.horizontal, 20)

                        Divider()
                            .background(Color.gray.opacity(0.3))
                            .padding(.horizontal, 20)

                        VStack(spacing: 0) {
                            ForEach(days) { day in
                                Button {
                                    selectedDay = day
                                    withAnimation(.spring()) {
                                        showDetailsPopup = true
                                    }
                                } label: {
                                    HStack {
                                        Text(day.dateString)
                                            .font(AppTypography.p)
                                            .foregroundColor(.black)
                                            .padding(.leading, 8)

                                        Spacer()

                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.black.opacity(0.6))
                                    }
                                    .padding(.vertical, 18)
                                }

                                if day.id != days.last?.id {
                                    Divider()
                                        .background(Color.gray.opacity(0.2))
                                        .padding(.leading, 30)
                                }
                            }
                        }
                        .padding(.horizontal, 50)
                    }

                    Spacer()
                }
                .blur(radius: showDetailsPopup ? 6 : 0)

                if showDetailsPopup {
                    HistoryDetailsPopupView(isPresented: $showDetailsPopup)
                        .transition(.move(edge: .bottom))
                }

            }
        }
    }
}

#Preview {
    HistoryView()
}
