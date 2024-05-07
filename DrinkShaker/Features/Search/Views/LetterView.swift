//
//  LetterView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 5/7/24.
//

import SwiftUI

struct LetterView: View {
    
    var letters: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    @Binding var chosenLetter: String
    
    var body: some View {
        VStack {
            ForEach(letters, id: \.self) { letter in
                Button(letter) {
                    chosenLetter = letter
                }
            }
        }
    }
}

#Preview {
    LetterView(chosenLetter: .constant("B"))
}
