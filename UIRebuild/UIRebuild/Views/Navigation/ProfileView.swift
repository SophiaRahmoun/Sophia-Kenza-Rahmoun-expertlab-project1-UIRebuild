//
//  ProfileView.swift
//  UIRebuild
//
//  Created by admin on 18/11/2025.
//

import SwiftUI



struct ProfileView: View {
    
    struct ProfileItem: Identifiable {
        let id = UUID()
        let icon: String
        let title: String
        let destination: ProfileDestination
    }
    
    @State private var selectedDestination: ProfileDestination?
    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""
    
    let profileItems: [ProfileItem] = [
        ProfileItem(icon: "medal", title: "My Subscription", destination: .subscription),
        ProfileItem(icon: "creditcard", title: "My Payment Method", destination: .payment),
        ProfileItem(icon: "heart", title: "Favorite Stations", destination: .favorites),
        ProfileItem(icon: "bell", title: "Notifications", destination: .notifications),
        ProfileItem(icon: "gearshape", title: "Settings", destination: .settings)
    ]
    
    var filteredItems: [ProfileItem] {
        if searchText.isEmpty { return profileItems }
        return profileItems.filter { $0.title.lowercased().contains(searchText.lowercased()) }
    }
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 50) {
                    
                    HStack {
                        Button { dismiss() } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 30, weight: .bold))
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 20)
                    
                    
                    HStack(spacing: 2) {
                        Text("My")
                            .font(AppTypography.h2)
                            .foregroundColor(.black)
                        
                        Image("villo logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 90)
                    }
                    .padding(.horizontal, 30)
                    
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Search", text: $searchText)
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.15))
                    .cornerRadius(12)
                    .padding(.horizontal, 20)
                    
                    
                    VStack(spacing: 0) {
                        ForEach(filteredItems) { item in
                            profileRow(item: item)
                            if item.id != filteredItems.last?.id {
                                Divider().background(Color.gray.opacity(0.3))
                            }
                        }
                    }
                    .background(Color.white)
                    .padding(.horizontal, 30)
                    .padding(.top, 10)
                    
                    Spacer()
                }
            }
        }
        .sheet(item: $selectedDestination) { destination in
            destinationView(for: destination)
        }
    }
    
    
    @ViewBuilder
    private func destinationView(for destination: ProfileDestination) -> some View {
        switch destination {
        case .subscription:
            SubscriptionView()
        case .payment:
            PaymentMethodView(selectedPlan: SubscriptionPlan(name: "Monthly", price: "9.99", priceSuffix: "/month", description: "Unlimited rides all month.", allowsQuantity: false))
        case .favorites:
            FavoriteStationsView()
        case .notifications:
            Text("Notifications screen coming soon")
        case .settings:
            SettingsView()
        }
    }
    
    
    private func profileRow(item: ProfileItem) -> some View {
        Button {
            selectedDestination = item.destination
        } label: {
            HStack(spacing: 16) {
                Image(systemName: item.icon)
                    .font(.system(size: 22))
                    .foregroundColor(.black)

                Text(item.title)
                    .font(AppTypography.h3)
                    .foregroundColor(.black)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundColor(.black.opacity(0.6))
            }
            .padding(.vertical, 23)
        }
    
    }
}

#Preview {
    ProfileView()
}
