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
        ZStack {
            Theme.background
                .ignoresSafeArea(edges: .top)
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(0...5, id: \.self) { item in
                        Text("Item \(item)")
        
                    }
                }
                .navigationTitle("Search Drinks")
            }
        }
    }
}

#Preview {
    SearchView()
}
