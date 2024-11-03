//
//  LoginPage.swift
//  Heels & Meals
//
//  Created by Natalie Ammerman on 11/2/24.
//

import SwiftUI

struct LoginPage: View {
    @State private var onyen = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.uncBlue.ignoresSafeArea()
                VStack {
                    Text("Single Sign-On").font(.largeTitle)
                    
                    TextField("Onyen", text: $onyen).font(.title).padding().background().foregroundColor(.black).cornerRadius(30)
                    TextField("Password", text: $password).font(.title).padding().background().foregroundColor(.black).cornerRadius(30)
                    NavigationLink(destination: BrowsePage()) {
                        Text("Login").font(.title).padding().background().foregroundColor(.black).cornerRadius(30)
                    }
                }
            }
        }
    }
}

#Preview {
    LoginPage()
}
