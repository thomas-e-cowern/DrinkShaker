//
//  AlcoholView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 3/20/24.
//

import SwiftUI

struct SpiritView: View {
    
    let alcohol: String?
    
    var body: some View {
        if let alcohol = alcohol {
            VStack {
                Text(alcohol)
                    .padding([.top, .bottom], 10)
                    .font(.callout)
                    .foregroundStyle(.white)
                    .font(.system(.body, design: .rounded))
                    .frame(maxWidth: .infinity)
                    .background(Theme.dodgerBlue)
                
                AsyncImage(url: URL(string: "https://www.thecocktaildb.com/images/ingredients/\(alcohol)-Medium.png")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        
                } placeholder: {
                    ProgressView()
                }
            }
            .frame(width: 200)
        }
    }
}

#Preview {
    SpiritView(alcohol: "Vodka")
}
