//
//  ConfirmationPage.swift
//  Heels & Meals
//
//  Created by Natalie Ammerman on 11/2/24.
//

import SwiftUI

struct ConfirmationPage: View {
    let mealCard: MealCard
    
    var body: some View {
        ZStack {
            Color.uncBlue.ignoresSafeArea()
            
            VStack(spacing: 24) {
                ZStack {
                    Circle()
                        .fill(.almostWhite)
                        .frame(width: 160, height: 160)
                    
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.green)
                }
                .padding(.top, 40)
                Spacer()
                VStack(spacing: 16) {
                    Text("Order Confirmed!")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.accentColor)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                    
                    Text("Your order from \(mealCard.storeName) is confirmed!")
                        .font(.title3)
                        .foregroundColor(.accentColor)
                        .multilineTextAlignment(.center)
                    
                    Text("Pickup time: \(mealCard.pickupTime)")
                        .foregroundColor(.accentColor)
                        .multilineTextAlignment(.center)
                    
                    Text(mealCard.location)
                        .foregroundColor(.accentColor)
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal)
                
                Spacer()
                .padding(.bottom, 30)
            }
        }
    }
}

#Preview {
    ConfirmationPage(mealCard: MealCard.example)
}
