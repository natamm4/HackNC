//
//  BrowsePage.swift
//  Heels & Meals
//
//  Created by Natalie Ammerman on 11/2/24.
//

import SwiftUI

struct BrowsePage: View {
    @State private var mealCards: [MealCard] = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.uncBlue.ignoresSafeArea()
                
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 16),
                        GridItem(.flexible(), spacing: 16)
                    ], spacing: 16) {
                        ForEach(mealCards) { card in
                            BrowseItemView(mealCard: card)
                        }
                    }
                    .padding()
                }
            }
        }
        .onAppear() {
            let url: URL = Bundle.main.url(forResource: "meal-cards", withExtension: "json")!
            let data = try! Data(contentsOf: url)
            mealCards = try! JSONDecoder().decode([MealCard].self, from: data)
        }
    }
}

#Preview {
    BrowsePage()
}
