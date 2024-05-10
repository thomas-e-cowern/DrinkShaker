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
    @State private var searchText = ""
    
    var body: some View {
        GeometryReader { geo in
            NavigationStack {
                ZStack {
                    background
                    HStack() {
                        if !svm.searchDrinks.isEmpty {
                            Spacer()
                            ScrollView(.vertical, showsIndicators: false) {
                                ForEach(searchResults,  id: \.id) { drink in
                                    NavigationLink {
                                        DrinkDetailView(drink: drink)
                                    } label: {
                                        DrinkCardView(drink: drink)
                                    }
                                    
                                }  //: End of ForEach
                            }
                        } else {
                            Spacer()
                            Text("Use the letters at the right to get drinks starting with that letter.  You can then use the search bar to search within the results")
                                .padding(.trailing)
                        }//: End of ScrollView
                        Spacer()
                        LetterView(chosenLetter: $letter)
                            .padding(.trailing, 10)
                            .onChange(of: letter, {
                                Task {
                                    searchText = ""
                                    await svm.getDrinksByFirstLetter(letter: letter)
                                }
                            })
                    } //: End of HStack
                } //: End of ZStack
                .navigationTitle("Search for Drinks")
            }
        } // MARK: End of Navigation Stack
        .searchable(text: $searchText)
    }
    
    var searchResults: [Drink] {
        if searchText.isEmpty {
            return svm.searchDrinks
        } else {
            return svm.searchDrinks.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
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
