//
//  SearchView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 2/14/24.
//

import SwiftUI

struct SearchView: View {
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    @StateObject private var svm = SearchViewModel()
    
    @State private var drinks: [Drink] = []
    @State private var letter: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                background
                
                HStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(drinks,  id: \.id) { drink in
                            NavigationLink {
                                DrinkDetailView(drink: drink)
                            } label: {
                                DrinkCardView(drink: drink)
                            }
                            
                        }  //: End of ForEach
                        .padding()
                    }//: End of ScrollView
                    LetterView(chosenLetter: $letter)
                        .onChange(of: letter, {
                            svm.getDrinksByFirstLetter(letter: letter)
                        })
                } //: End of HStack
                
            } //: End of ZStack
            .navigationTitle("Search Drinks")
            .onAppear {
                do {
                    let res = try StaticJsonMapper.decode(file: "DrinksStaticJson", type: CocktailDBAPIResponse.self)
                    
                    drinks = res.drinks
                } catch {
                    print(error)
                }
            } // End of onAppear
            
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
