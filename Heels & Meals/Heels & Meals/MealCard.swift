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
    let description: String
    let location: String
    let dietaryRestrictions: [String]
    let vendorType: String
    
    // Add CodingKeys to map JSON fields to our properties
    enum CodingKeys: String, CodingKey {
        case id
        case storeName = "source"
        case itemTitle
        case pickupTime
        case price
        case distance
        case image
        case description
        case location
        case dietaryRestrictions
        case vendorType
    }
}

extension MealCard {
    static var example: MealCard {
        if let url = Bundle.main.url(forResource: "meal-cards", withExtension: "json"),
           let data = try? Data(contentsOf: url),
           let mealCards = try? JSONDecoder().decode([MealCard].self, from: data),
           let firstMeal = mealCards.first {
            return firstMeal
        }
        
        // Fallback data in case JSON loading fails
        return MealCard(
            id: 1,
            storeName: "Roots",
            itemTitle: "Mystery Vegetarian Bowl",
            pickupTime: "5:00 PM - 7:00 PM",
            price: "$5.00",
            distance: "2 miles",
            image: "RootsBowl",
            description: "A hearty vegetarian bowl featuring seasonal roasted vegetables.",
            location: "133 W Franklin St Suite A-115, Chapel Hill, NC 27516",
            dietaryRestrictions: ["Vegetarian"],
            vendorType: "Restaurant"
        )
    }
}
