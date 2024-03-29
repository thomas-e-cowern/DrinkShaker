//
//  HeaderView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 2/15/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundStyle(.dodgerBlue)
            
            VStack {
                Text("Drink Shaker")
                    .font(.system(size: 50))
                    .foregroundStyle(Color.white)
                    .bold()
                
                Text("Get your drink on...")
                    .font(.system(size: 30))
                    .foregroundStyle(Color.white)
            }
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 250)
    }
}

#Preview {
    HeaderView()
}
