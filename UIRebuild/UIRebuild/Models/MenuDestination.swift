//
//  MenuDestination.swift
//  UIRebuild
//
//  Created by admin on 18/11/2025.
//

import Foundation

enum MenuDestination: Identifiable {
    case profile
    case subscription
    case history
    case help
    case settings
    case stationAlert

    var id: String {
        switch self {
        case .profile: return "profile"
        case .subscription: return "subscription"
        case .history: return "history"
        case .help: return "help"
        case .settings: return "settings"
        case .stationAlert: return "stationAlert"
        }
    }
}
