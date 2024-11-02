//
//  BrowseItemView.swift
//  Heels & Meals
//
//  Created by Natalie Ammerman on 11/2/24.
//

import SwiftUI

struct BrowseItemView: View {
    @State private var storeName = ""
    @State private var itemTitle = ""
    @State private var pickupTime = ""
    @State private var price = ""
    @State private var distance = ""
    @State private var img = ""
    
    var body: some View {
        VStack {
            Image(img)
            Text(storeName)
            Text(itemTitle)
            HStack {
                Text(distance)
                Text(price)
            }
        }
    }
}



#Preview {
    BrowseItemView()
}
