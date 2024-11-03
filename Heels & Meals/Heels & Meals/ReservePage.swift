//
//  ReservePage.swift
//  Heels & Meals
//
//  Created by Natalie Ammerman on 11/2/24.
//

import SwiftUI

struct ReservePage: View {
    let mealCard: MealCard
    let salesTaxRate = 0.0775
    
    var subtotal: Double {
        Double(mealCard.price.dropFirst().replacingOccurrences(of: ",", with: "")) ?? 0.0
    }
    
    var salesTax: Double {
        subtotal * salesTaxRate
    }
    
    var total: Double {
        subtotal + salesTax
    }
    
    var body: some View {
        ZStack {
            Color.accentColor.ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Order Details Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Order Details")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                        
                        Text(mealCard.storeName)
                            .font(.title3)
                            .foregroundColor(.white)
                        Text(mealCard.itemTitle)
                            .foregroundColor(.white)
                    }
                    
                    // Pickup Details Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Pickup Details")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                        
                        Text("Pickup Today")
                            .font(.headline)
                            .foregroundColor(.white)
                        Text(mealCard.pickupTime)
                            .foregroundColor(.white)
                        Text(mealCard.location)
                            .foregroundColor(.white)
                    }
                    
                    // Payment Method Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Payment Method")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                        
                        HStack {
                            Image(systemName: "creditcard.fill")
                                .foregroundColor(.white)
                            Text("•••• 1234")
                                .foregroundColor(.white)
                        }
                    }
                    
                    // Order Summary Section
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Order Summary")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                        
                        VStack(spacing: 8) {
                            HStack {
                                Text("Subtotal")
                                    .foregroundColor(.white)
                                Spacer()
                                Text(String(format: "$%.2f", subtotal))
                                    .foregroundColor(.white)
                            }
                            
                            HStack {
                                Text("Sales Tax")
                                    .foregroundColor(.white)
                                Spacer()
                                Text(String(format: "$%.2f", salesTax))
                                    .foregroundColor(.white)
                            }
                            
                            Divider()
                                .background(.white)
                            
                            HStack {
                                Text("Total")
                                    .bold()
                                    .foregroundColor(.white)
                                Spacer()
                                Text(String(format: "$%.2f", total))
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    // Confirm Button
                    NavigationLink(destination: ConfirmationPage(mealCard: mealCard)) {
                        Text("Confirm Order")
                            .font(.system(size: 30, weight: .bold))
                            .frame(width: 200)
                            .padding()
                            .background(.almostWhite)
                            .foregroundColor(.accentColor)
                            .cornerRadius(30)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(20)
            }
        }
        .navigationTitle("Reserve")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(Color.accentColor, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        ReservePage(mealCard: MealCard.example)
    }
}
