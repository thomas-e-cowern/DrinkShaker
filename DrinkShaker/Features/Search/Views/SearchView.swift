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
                Theme.background
                    .ignoresSafeArea(edges: .top)
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(0...5, id: \.self) { item in
                            VStack(spacing: 0) {
                                Rectangle()
                                    .fill(.blue)
                                    .frame(height: 130)
                                
                                VStack(alignment: .leading) {
                                    Text("#\(item)")
                                        .font(
                                            .system(.caption, design: .rounded)
                                            .bold()
                                        )
                                        .foregroundStyle(.white)
                                        .padding(.horizontal, 9)
                                        .padding(.vertical, 4)
                                        .background(Theme.carmine, in: Capsule())
                                    
                                    Text("<Drink Name>")
                                        .foregroundStyle(Theme.text)
                                        .font(.system(.body, design: .rounded))
                                        .background(Theme.detailBackground)
                                } //: End of VStack
                                .frame(maxWidth: .infinity, alignment: .leading)
                            } //: End of VStack
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .shadow(color: Theme.text.opacity(0.1), radius: 2, x: 0, y: 1)
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
