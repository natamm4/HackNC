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
            
            Text("Heels & Meals connects UNC students with local restaurants and stores to provide discounted meals from surplus food that would otherwise go to waste. We're fighting food insecurity on campus while helping reduce food waste in the Chapel Hill/Carrboro area.")
                .multilineTextAlignment(.center)
                .padding()
                .background(.white)
                .cornerRadius(15)
                .padding(.horizontal)
        }
    }
}

#Preview {
    AboutUsView()
}
