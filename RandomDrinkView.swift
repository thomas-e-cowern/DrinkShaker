//
//  RandomDrinkView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 9/14/22.
//

import SwiftUI

struct RandomDrinkView: View {
    var body: some View {
        Text("Shake Your Phone for a random Drink!")
            .onShake {
                print("This is where we get a random recips")
            }
    }
}

struct RandomDrinkView_Previews: PreviewProvider {
    static var previews: some View {
        RandomDrinkView()
    }
}
