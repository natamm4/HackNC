//
//  ReservePage.swift
//  Heels & Meals
//
//  Created by Natalie Ammerman on 11/2/24.
//

import SwiftUI

struct ReservePage: View {
    let mealCard: MealCard
    
    var body: some View {
        Text(mealCard.itemTitle)
    }
}

#Preview {
    ReservePage(mealCard: MealCard.example)
}
