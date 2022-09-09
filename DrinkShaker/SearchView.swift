//
//  SearchView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 9/9/22.
//

import SwiftUI

struct SearchView: View {
    
    
    @StateObject private var networkingController = NetworkingController()
    @State var text: String = ""
    
    var body: some View {
        NavigationView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .navigationBarTitle("", displayMode: .inline)
                .toolbar {
                    ToolbarItemGroup (placement: .primaryAction) {
                        HStack {
                            TextField("Search...", text: $text)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(minWidth: 300)
                                .onSubmit {
                                    // Will be search funtion
                                }
                            Button {
                                print("Search string is \(text)")
        //                        search()
                                networkingController.fetchDrinkRecipes()
                                
                            } label: {
                                Image(systemName: "magnifyingglass")
                            }
                            .padding(.trailing, 10)
                        }
                    }
                }
        }

    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
