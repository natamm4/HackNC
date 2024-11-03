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
                VStack(spacing: 20) {
                    ZStack {
                        Circle()
                            .fill(.almostWhite)
                            .frame(width: 220, height: 220)
                        
                        Image("Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                    }
                    .padding(.top, 30)
                    
                    Text("Heels & Meals")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.footGrey)
                    
                    Spacer()
                    
                    NavigationLink(destination: LoginPage()) {
                        Text("Login")
                            .font(.system(size: 30, weight: .bold))
                            .frame(width: 200)
                            .padding()
                            .background()
                            .foregroundColor(.footGrey)
                            .cornerRadius(30)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: AboutUsView()) {
                        Text("About Us")
                            .font(.headline)
                            .padding()
                            .background(.almostWhite)
                            .cornerRadius(15)
                    }
                }
            }
        }
    }
}

#Preview {
    HomePage()
}
