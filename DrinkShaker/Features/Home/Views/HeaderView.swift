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
                .foregroundStyle(.carmine)
//                .rotationEffect(Angle(degrees: 15))
            
            VStack {
                Text("Drink Shaker")
                    .font(.system(size: 50))
                    .foregroundStyle(Color.white)
                    .bold()
                
                Text("Get your drink on...")
                    .font(.system(size: 30))
                    .foregroundStyle(Color.white)
            }
            .padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 200)
        .offset(y: -100)
    }
}

#Preview {
    HeaderView()
}
