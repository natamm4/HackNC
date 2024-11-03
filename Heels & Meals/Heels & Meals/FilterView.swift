//
//  FilterView.swift
//  Heels & Meals
//
//  Created by Natalie Ammerman on 11/3/24.
//

import SwiftUI

struct FilterView: View {
    @Binding var selectedFilters: Set<String>
    @Binding var selectedVendorTypes: Set<String>
    let dietaryOptions: [String]
    let vendorTypes: [String]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.accentColor.ignoresSafeArea()
                
                List {
                    Section {
                        ForEach(vendorTypes, id: \.self) { type in
                            Button(action: {
                                if selectedVendorTypes.contains(type) {
                                    selectedVendorTypes.remove(type)
                                } else {
                                    selectedVendorTypes.insert(type)
                                }
                            }) {
                                HStack {
                                    Text(type)
                                        .foregroundColor(.primary)
                                    Spacer()
                                    if selectedVendorTypes.contains(type) {
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.accentColor)
                                    }
                                }
                            }
                        }
                    } header: {
                        Text("Vendor Type")
                            .foregroundColor(.almostWhite)
                            .textCase(nil)
                            .font(.headline)
                    }
                    
                    Section {
                        ForEach(dietaryOptions, id: \.self) { option in
                            Button(action: {
                                if selectedFilters.contains(option) {
                                    selectedFilters.remove(option)
                                } else {
                                    selectedFilters.insert(option)
                                }
                            }) {
                                HStack {
                                    Text(option)
                                        .foregroundColor(.primary)
                                    Spacer()
                                    if selectedFilters.contains(option) {
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.accentColor)
                                    }
                                }
                            }
                        }
                    } header: {
                        Text("Dietary Restrictions")
                            .foregroundColor(.almostWhite)
                            .textCase(nil)
                            .font(.headline)
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Filters")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.accentColor, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundColor(.almostWhite)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}

#Preview {
    FilterView(
        selectedFilters: .constant(["Vegetarian"]),
        selectedVendorTypes: .constant(["Restaurant"]),
        dietaryOptions: ["Vegetarian", "Vegan", "Gluten-Free", "Dairy-Free"],
        vendorTypes: ["Restaurant", "Bakery", "Grocery"]
    )
}
