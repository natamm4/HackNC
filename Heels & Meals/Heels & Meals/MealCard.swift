//
//  BrowseItemView.swift
//  Heels & Meals
//
//  Created by Natalie Ammerman on 11/2/24.
//

import SwiftUI

struct MealCard: Codable, Identifiable {
    let id: Int
    let storeName: String
    let itemTitle: String
    let pickupTime: String
    let price: String
    let distance: String
    let image: String
    
    // Add CodingKeys to map JSON fields to our properties
    enum CodingKeys: String, CodingKey {
        case id
        case storeName = "source"
        case itemTitle
        case pickupTime
        case price
        case distance
        case image
    }
}
