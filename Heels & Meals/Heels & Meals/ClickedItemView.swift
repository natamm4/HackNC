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
        ZStack {
            Color.accentColor.ignoresSafeArea()
            
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
                            .foregroundColor(.white)
                        
                        // Item details section
                        VStack(alignment: .leading, spacing: 8) {
                            Text(mealCard.itemTitle)
                                .font(.title2)
                                .foregroundColor(.white)
                            Text("Pickup: \(mealCard.pickupTime)")
                                .foregroundColor(.white)
                            Text("Price: \(mealCard.price)")
                                .bold()
                                .foregroundColor(.white)
                        }
                        
                        // Location section
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Location")
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(mealCard.location)
                                .foregroundColor(.white)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        
                        // Description section
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Description")
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(mealCard.description)
                                .foregroundColor(.white)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        
                        // Dietary restrictions section
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Dietary Restrictions")
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(mealCard.dietaryRestrictions.joined(separator: ", "))
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        
                        // Reserve button
                        NavigationLink(destination: ReservePage(mealCard: mealCard)) {
                            Text("Reserve")
                                .font(.title3)
                                .bold()
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white)
                                .foregroundColor(Color.accentColor)
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
}

#Preview {
    NavigationStack {
        ClickedItemView(mealCard: MealCard.example)
    }
}
