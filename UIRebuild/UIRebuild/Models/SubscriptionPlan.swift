//
//  SubscriptionPlan.swift
//  UIRebuild
//
//  Created by admin on 20/10/2025.
//
import Foundation

struct SubscriptionPlan: Identifiable {
    let id = UUID()
    let name: String
    let price: String
       let priceSuffix: String?  //month , day etc
       let description: String
       let allowsQuantity: Bool
}
