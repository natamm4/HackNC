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
                VStack(spacing: 20) {
                    Text("Single Sign-On")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.almostWhite)
                        .padding(.top, 50)
                        .padding(.bottom, 130)
                    
                    //Spacer()
                    
                    VStack(spacing: 40) {

                        VStack(spacing: 20) {

                           TextField("Onyen", text: $onyen)
                            .font(.title)
                            .padding()
                            .frame(width: 300)
                            .background(.almostWhite)
                            .cornerRadius(30)
                        
                        TextField("Password", text: $password)
                            .font(.title)
                            .padding()
                            .frame(width: 300)
                            .background(.almostWhite)
                            .cornerRadius(30) 
                        }

                        NavigationLink(destination: BrowsePage()) {
                            Text("Sign In")
                                .font(.system(size: 30, weight: .bold))
                                .frame(width: 100)
                                .padding()
                                .background(.almostWhite)
                                .foregroundColor(.accentColor)
                                .cornerRadius(30)
                        }
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    LoginPage()
}
