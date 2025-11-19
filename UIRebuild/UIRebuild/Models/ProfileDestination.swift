//
//  ProfileDestination.swift
//  UIRebuild
//
//  Created by admin on 19/11/2025.
//

import Foundation

enum ProfileDestination: Identifiable {
    case subscription
    case payment
    case favorites
    case notifications
    case settings

    var id: String {
        switch self {
        case .subscription: return "subscription"
        case .payment: return "payment"
        case .favorites: return "favorites"
        case .notifications: return "notifications"
        case .settings: return "settings"
        }
    }
}
