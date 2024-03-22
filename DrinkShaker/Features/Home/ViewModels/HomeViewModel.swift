//
//  HomeViewModel.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 3/21/24.
//

import Foundation


final class HomeViewModel: ObservableObject {
    
    @Published private(set) var spiritOfTheDayName: String?
//    @Published private(set) var spiritOfTheDay: Ingredients?
    private var date: Date = Date.now
    
    
    func getSpiritOfTheDay() {

        print("Inside SOTD")
        // 1. Check to see if there is a saved spirit of the day and date
        let storedSpiritOfTheDay = UserDefaults.standard.string(forKey: "spiritOfTheDay")
        let storedSpiritDate = UserDefaults.standard.object(forKey: "spiritDate")
        
        if let storedSpiritOfTheDay = storedSpiritOfTheDay {
            print("storedSpiritOfTheDay: ", storedSpiritOfTheDay)
        }
        
        if let storedSpiritDate = storedSpiritDate {
            print("spiritDate: ", storedSpiritDate)
        }
        
        // 2. If not get a random spirit and save the spirit object
        if let storedSpiritOfTheDay = storedSpiritOfTheDay {
            print("storedSpiritOfTheDay: ", storedSpiritOfTheDay)
            // 3. If there is, we need check to see if it is todays spirit
            if Calendar.current.isDateInToday(date) {
                // 4. If it is, spirit of the day stays the same
                spiritOfTheDayName = storedSpiritOfTheDay
            } else {
                // 5. If it is not, get a new random spirit and save
                spiritOfTheDayName = spirits.randomElement()
                UserDefaults.standard.set(spiritOfTheDayName, forKey: "spiritOfTheDay")
                UserDefaults.standard.set(date, forKey: "spiritDate")
            }
        }
        
        
        
        
    }
}


