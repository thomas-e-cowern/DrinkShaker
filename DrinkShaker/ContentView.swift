//
//  ContentView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 2/13/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .onAppear {
                    print("Drink coming....")
                    dump(
                        try? StaticJsonMapper.decode(file: "DrinksStaticJson", type: CocktailDBAPIResponse.self)
                    )
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
