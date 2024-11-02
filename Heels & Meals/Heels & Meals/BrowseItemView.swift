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
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .clipped()
                .cornerRadius(10, corners: [.topLeft, .topRight])
            
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
        .padding(.bottom)
        .frame(width: 170, height: 300)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
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
            dietaryRestrictions: ["Vegetarian"]
        )
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

#Preview {
    BrowseItemView(mealCard: MealCard.example)
}
