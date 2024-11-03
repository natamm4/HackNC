//
//  BrowsePage.swift
//  Heels & Meals
//
//  Created by Natalie Ammerman on 11/2/24.
//

import SwiftUI

struct BrowsePage: View {
    @State private var mealCards: [MealCard] = []
    @State private var searchText = ""
    @State private var showFilters = false
    @State private var selectedDietaryFilters: Set<String> = []
    @State private var selectedVendorTypes: Set<String> = []
    
    let dietaryOptions = ["Vegetarian", "Vegan", "Gluten-Free", "Dairy-Free"]
    let vendorTypes = ["Restaurant", "Bakery", "Grocery"]
    
    var filteredMealCards: [MealCard] {
        var filtered = searchText.isEmpty ? mealCards : mealCards.filter { 
            $0.itemTitle.localizedCaseInsensitiveContains(searchText) ||
            $0.storeName.localizedCaseInsensitiveContains(searchText)
        }
        
        if !selectedDietaryFilters.isEmpty {
            filtered = filtered.filter { card in
                !selectedDietaryFilters.isDisjoint(with: card.dietaryRestrictions)
            }
        }
        
        if !selectedVendorTypes.isEmpty {
            filtered = filtered.filter { card in
                selectedVendorTypes.contains(card.vendorType)
            }
        }
        
        return filtered
    }
    
    var activeFilterCount: Int {
        selectedDietaryFilters.count + selectedVendorTypes.count
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.uncBlue.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Search and Filter Header
                    VStack(spacing: 8) {
                        // Search Bar
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            TextField("Search deals...", text: $searchText)
                                .textFieldStyle(PlainTextFieldStyle())
                        }
                        .padding(8)
                        .background(.almostWhite)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        
                        // Filter Button
                        HStack {
                            Button(action: { showFilters.toggle() }) {
                                HStack {
                                    Image(systemName: "line.3.horizontal.decrease.circle")
                                    Text("Filters")
                                }
                                .foregroundColor(.white)
                                .padding(.vertical, 8)
                            }
                            
                            if activeFilterCount > 0 {
                                Text("\(activeFilterCount) active")
                                    .font(.caption)
                                    .foregroundColor(.white)
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                    .background(Color.accentColor)
                    
                    ScrollView {
                        // Filter chips (if filters are selected)
                        if !selectedDietaryFilters.isEmpty || !selectedVendorTypes.isEmpty {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    if !selectedDietaryFilters.isEmpty {
                                        ForEach(Array(selectedDietaryFilters), id: \.self) { filter in
                                            HStack {
                                                Text(filter)
                                                Button(action: {
                                                    selectedDietaryFilters.remove(filter)
                                                }) {
                                                    Image(systemName: "xmark.circle.fill")
                                                }
                                            }
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 6)
                                            .background(.almostWhite)
                                            .foregroundColor(.accentColor)
                                            .cornerRadius(20)
                                        }
                                    }
                                    
                                    if !selectedVendorTypes.isEmpty {
                                        ForEach(Array(selectedVendorTypes), id: \.self) { type in
                                            HStack {
                                                Text(type)
                                                Button(action: {
                                                    selectedVendorTypes.remove(type)
                                                }) {
                                                    Image(systemName: "xmark.circle.fill")
                                                }
                                            }
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 6)
                                            .background(.almostWhite)
                                            .foregroundColor(.accentColor)
                                            .cornerRadius(20)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                            }
                        }
                        
                        // Meal Cards Grid
                        LazyVGrid(columns: [
                            GridItem(.flexible(), spacing: 16),
                            GridItem(.flexible(), spacing: 16)
                        ], spacing: 16) {
                            ForEach(filteredMealCards) { card in
                                NavigationLink(destination: ClickedItemView(mealCard: card)) {
                                    BrowseItemView(mealCard: card)
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .sheet(isPresented: $showFilters) {
                FilterView(selectedFilters: $selectedDietaryFilters, selectedVendorTypes: $selectedVendorTypes, dietaryOptions: dietaryOptions, vendorTypes: vendorTypes)
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
