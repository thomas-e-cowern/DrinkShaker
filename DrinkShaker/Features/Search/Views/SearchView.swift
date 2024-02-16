//
//  SearchView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 2/14/24.
//

import SwiftUI

struct SearchView: View {
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    @State private var drinks: [Drink] = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                background
                
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(drinks,  id: \.id) { drink in
                        NavigationLink {
                            DrinkDetailView(drink: drink)
                        } label: {
                            DrinkCardView(drink: drink)
                        }
                        
                    }  //: End of ForEach
                    .padding()
                }  //: End of ScrollView
            } //: End of ZStack
            .navigationTitle("Search Drinks")
            .onAppear {
                do {
                    let res = try StaticJsonMapper.decode(file: "DrinksStaticJson", type: CocktailDBAPIResponse.self)
                    
                    drinks = res.drinks
                } catch {
                    print(error)
                }
            }
        } // MARK: End of Navigation Stack
    }
}

#Preview {
    SearchView()
}

private extension SearchView {
    var background: some View {
        Theme.background
            .ignoresSafeArea()
    }
}
