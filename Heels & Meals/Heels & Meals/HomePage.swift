//
//  HomePage.swift
//  Heels & Meals
//
//  Created by Natalie Ammerman on 11/2/24.
//

import SwiftUI

struct HomePage: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.uncBlue.ignoresSafeArea()
                VStack {
                    Text("Heels & Meals").font(.largeTitle)
                    Text("About Us").font(.headline)
                    Text("")
                    NavigationLink(destination: LoginPage()) {
                        Text("Login").font(.title).padding().background().foregroundColor(.black).cornerRadius(30)
                    }
                }
            }
        }
    }
}

#Preview {
    HomePage()
}
