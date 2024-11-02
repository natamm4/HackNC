//
//  ClickedItemView.swift
//  Heels & Meals
//
//  Created by Natalie Ammerman on 11/2/24.
//

import SwiftUI

struct ClickedItemView: View {
    let mealCard: MealCard
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Image section
                Image(mealCard.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: UIScreen.main.bounds.height * 0.25)
                    .clipped()
                    .ignoresSafeArea(edges: .top)
                
                VStack(alignment: .leading, spacing: 24) {
                    // Vendor name
                    Text(mealCard.storeName)
                        .font(.title)
                        .bold()
                    
                    // Item details section
                    VStack(alignment: .leading, spacing: 8) {
                        Text(mealCard.itemTitle)
                            .font(.title2)
                        Text("Pickup: \(mealCard.pickupTime)")
                        Text(mealCard.price)
                            .bold()
                    }
                    
                    // Location section
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Location")
                            .font(.headline)
                        Text(mealCard.location)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    // Description section
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Description")
                            .font(.headline)
                        Text(mealCard.description)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    // Dietary restrictions section
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Dietary Restrictions")
                            .font(.headline)
                        Text(mealCard.dietaryRestrictions.joined(separator: ", "))
                    }
                    
                    Spacer()
                    
                    // Reserve button
                    NavigationLink(destination: ReservePage(mealCard: mealCard)) {
                        Text("Reserve")
                            .font(.title3)
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.uncBlue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ClickedItemView(mealCard: MealCard.example)
    }
}
