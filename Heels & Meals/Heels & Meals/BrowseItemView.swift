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
        VStack(spacing: 0) {
            Image(mealCard.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .clipped()
                .clipShape(UnevenRoundedRectangle(cornerRadii: .init(
                    topLeading: 10,
                    bottomLeading: 0,
                    bottomTrailing: 0,
                    topTrailing: 10
                )))
            
            Text("\(mealCard.itemTitle) - \(mealCard.storeName)")
                .font(.subheadline)
                .foregroundColor(.almostWhite)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .frame(height: 65)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 8)
                .background(Color.accentColor)
            Spacer()
            HStack {
                Text(mealCard.distance)
                    .font(.caption)
                Spacer()
                Text(mealCard.price)
            }
            .padding(.horizontal)
            .padding(.top, 8)
            
            Text("Pickup: \(mealCard.pickupTime)")
                .font(.caption)
        }
        .padding(.bottom)
        .frame(width: 170, height: 300)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    BrowseItemView(mealCard: MealCard.example)
}
