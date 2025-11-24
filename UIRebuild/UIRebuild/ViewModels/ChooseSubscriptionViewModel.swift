//
//  ChooseSubscriptionViewModel.swift
//  UIRebuild
//
//  Created by admin on 21/11/2025.
//

import SwiftUI

class ChooseSubscriptionViewModel: ObservableObject {
    @Published var currentIndex: Int = 0
       
       @Published var quantity: Int = 1   // only for 1-day ticket
       
       @Published var plans: [SubscriptionPlan] = [
        
     //1 day
        SubscriptionPlan(
                   name: "1 Day Ticket",
                   price: "1.50",
                   priceSuffix: nil,
                   description:
                       """
                       Valid 24h. Unlimited trips. First 30 minutes free per trip.
                       Then €0.50 for the next 30 min, €1.00 for the third, then €2.00 per extra 30 min.
                       """,
                   allowsQuantity: true
               ),
               
               //MONTHs
               SubscriptionPlan(
                   name: "Monthly",
                   price: "3.50",
                   priceSuffix: "/month",
                   description:
                       """
                       Unlimited trips for 1 month. First 30 minutes free. Then €0.50, €1.00, then €2.00 per extra 30 min.
                       """,
                   allowsQuantity: false
               ),
               
               // EVILLO
               SubscriptionPlan(
                   name: "eVillo Option",
                   price: "4.50",
                   priceSuffix: "/month",
                   description:
                       """
                       Add an electric battery to your Villo subscription. Delivery takes ±2 weeks. Subscription starts after delivery.
                       """,
                   allowsQuantity: false
               ),
               
               // BUSINESS
               SubscriptionPlan(
                   name: "Villo Business",
                   price: "42.00",
                   priceSuffix: nil,
                   description:
                       """
                       Employer pays the yearly subscription. Employee pays extra ride fees and deposit if needed.
                       First 30 min free. Same ride fees apply.
                       """,
                   allowsQuantity: false
               ),
               
               // PROMOTION HEY!
               SubscriptionPlan(
                   name: "Villo Promotion",
                   price: "1.00",
                   priceSuffix: "for 6 months",
                   description:
                       """
                       Exclusive Hey! Telecom offer. €1 for 6 months. Then €3.50/month with automatic renewal.
                       Same ride conditions apply.
                       """,
                   allowsQuantity: false
               ),
               
               // BRUSSELS CARD
               SubscriptionPlan(
                   name: "Brussels Card",
                   price: "4.50",
                   priceSuffix: "/3 days",
                   description:
                       """
                       Unlimited trips for 72h with a Brussels Card code.
                       After 30 min free: €0.50, €1.00, then €2.00 per extra 30 min.
                       """,
                   allowsQuantity: false
               )
           ]
    
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
