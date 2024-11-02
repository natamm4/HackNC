//
//  BrowseItemView.swift
//  Heels & Meals
//
//  Created by Natalie Ammerman on 11/2/24.
//

import SwiftUI

struct BrowseItemView: View {
    let mealCard: MealCard
    
    var body: some View {
        VStack(spacing: 8) {
            Image(mealCard.image)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .frame(maxWidth: .infinity)
            
            Text("\(mealCard.itemTitle) - \(mealCard.storeName)")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 8)
            
            Spacer()
            
            HStack {
                Text(mealCard.distance)
                    .font(.caption)
                    .lineLimit(1)
                Spacer()
                Text(mealCard.price)
                    .lineLimit(1)
            }
            .padding(.horizontal)
            
            Text(mealCard.pickupTime)
                .font(.caption)
                .lineLimit(1)
        }
        .padding()
        .frame(width: 170, height: 300)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

extension MealCard {
    static let example = MealCard(
        id: 1,
        storeName: "Roots",
        itemTitle: "Mystery Vegetarian Bowl",
        pickupTime: "5:00 PM - 7:00 PM",
        price: "$5.00",
        distance: "2 miles",
        image: "vegan_salad.png"
    )
}

#Preview {
    BrowseItemView(mealCard: MealCard.example)
}
