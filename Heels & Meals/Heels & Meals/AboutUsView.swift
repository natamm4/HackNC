//
//  AboutUsView.swift
//  Heels & Meals
//
//  Created by Natalie Ammerman on 11/2/24.
//

import SwiftUI

struct AboutUsView: View {
    var body: some View {
        ZStack {
            Color.uncBlue.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("About Us")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
             
                Text("At UNC, our development team noticed a growing issue among students: too much food going to waste, and too many students missing out on affordable, fresh meals.")
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(.white)
                    .cornerRadius(15)
                
                Text("This summer, our team first encountered an app called Too Good To Go while studying abroad in Copenhagen, Denmark. This application allows people in big cities to purchase food for cheaper.")
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(.white)
                    .cornerRadius(15)
                
                Text("Inspired, we came together to build something tailored for our community: an application that connects UNC students with local restaurants and stores to find discounted meals from surplus food that would otherwise go to waste.")
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(.white)
                    .cornerRadius(15)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    AboutUsView()
}
