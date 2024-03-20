//
//  AlcoholView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 3/20/24.
//

import SwiftUI

struct AlcoholView: View {
    
    let alcohol: String?
    
    var body: some View {
        if let alcohol = alcohol {
            VStack {
                Text(alcohol)
                
                AsyncImage(url: URL(string: "https://www.thecocktaildb.com/images/ingredients/\(alcohol)-Medium.png")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        
                } placeholder: {
                    ProgressView()
                }
            }
        }
    }
}

#Preview {
    AlcoholView(alcohol: "Vodka")
}
