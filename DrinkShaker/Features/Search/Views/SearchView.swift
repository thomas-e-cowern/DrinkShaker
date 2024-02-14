//
//  SearchView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 2/14/24.
//

import SwiftUI

struct SearchView: View {
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                background
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(0...5, id: \.self) { item in
//                            DrinkDetailView(drink: item)
                        }  //: End of ForEach
                        
                    } //: End of Grid
                    .padding()
                }  //: End of ScrollView
            } //: End of ZStack
            .navigationTitle("Search Drinks")
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
