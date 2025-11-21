//
//  ChooseSubscriptionViewModel.swift
//  UIRebuild
//
//  Created by admin on 21/11/2025.
//

import SwiftUI

class ChooseSubscriptionViewModel: ObservableObject {
    @Published var plans: [SubscriptionPlan] = [
        SubscriptionPlan(name: "1 Day Ticket"),
        SubscriptionPlan(name: "Monthly"),
        SubscriptionPlan(name: "eVillo Option"),
        SubscriptionPlan(name: "Villo Business"),
        SubscriptionPlan(name: "Villo Promotion"),
        SubscriptionPlan(name: "Brussels Card")
    ]
    
    @Published var currentIndex: Int = 0
    
    func next() {
        if currentIndex < plans.count - 1 {
            withAnimation(.spring()) {
                currentIndex += 1
            }
        }
    }
    
    func previous() {
        if currentIndex > 0 {
            withAnimation(.spring()) {
                currentIndex -= 1
            }
        }
    }
}
