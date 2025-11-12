//
//  FilterOption.swift
//  UIRebuild
//
//  Created by admin on 5/11/2025.
//

enum FilterOption: String, CaseIterable, Identifiable {
    case electric = "Electric Bikes"
    case mechanical = "Mechanical Bikes"
    case parking = "Parking"

    var id: String { self.rawValue }
}
