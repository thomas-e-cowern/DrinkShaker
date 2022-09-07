//
//  HomeView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 9/7/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var dataController: DataController
    
    var body: some View {
        NavigationView {
            VStack {
                Button("Add Recipes") {
                    dataController.deleteAll()
                    try? dataController.createSampleData()
                }
            }
            .navigationBarTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
