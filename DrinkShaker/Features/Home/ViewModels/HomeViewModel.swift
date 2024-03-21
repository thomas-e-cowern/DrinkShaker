//
//  HomeViewModel.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 3/21/24.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    private var spiritOfTheDay: String?
    private var date: Date = Date.now
    
    func getSpiritOfTheDay() {
        
        spiritOfTheDay = spirits.randomElement()
        print("Spirit of the day: \(spiritOfTheDay ?? "No spirit today!")")

        let storedSpiritOfTheDay = UserDefaults.standard.object(forKey: "alcoholOfTheDay")
        let storedSpiritDate = UserDefaults.standard.object(forKey: "spiritDate")
        print("storedSpiritOfTheDay: ", storedSpiritOfTheDay ?? "No spirit today")
        print("spiritDate: ", storedSpiritDate ?? "No spirit date")
        
        if storedSpiritOfTheDay == nil {
            print("store spirit is nil")
            UserDefaults.standard.set(spiritOfTheDay, forKey: "alcoholOfTheDay")
            UserDefaults.standard.set(date, forKey: "spiritDate")
        } else {
            print("stored spirit is not nil")
            if !Calendar.current.isDateInToday(date) {
                print("This is not from today")
                UserDefaults.standard.set(spiritOfTheDay, forKey: "alcoholOfTheDay")
                UserDefaults.standard.set(date, forKey: "spiritDate")
            } else {
                print("This is from today")
            }
        }
    }
}


