//
//  HomeViewModel.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 3/21/24.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    @Published private(set) var spiritOfTheDay: String?
    private var date: Date = Date.now
    
    func getSpiritOfTheDay() {
        
//        spiritOfTheDay = spirits.randomElement()
//        print("Spirit of the day: \(spiritOfTheDay ?? "No spirit today!")")

        let storedSpiritOfTheDay = UserDefaults.standard.object(forKey: "alcoholOfTheDay")
        let storedSpiritDate = UserDefaults.standard.object(forKey: "spiritDate")
        print("storedSpiritOfTheDay: ", storedSpiritOfTheDay ?? "No spirit today")
        print("spiritDate: ", storedSpiritDate ?? "No spirit date")
        
        if storedSpiritOfTheDay == nil {
            print("store spirit is nil")
            spiritOfTheDay = spirits.randomElement()
            UserDefaults.standard.set(spiritOfTheDay, forKey: "alcoholOfTheDay")
            UserDefaults.standard.set(date, forKey: "spiritDate")
        } else {
            print("We have a spirit in user data")
            if !Calendar.current.isDateInToday(date) {
                print("This is from a previous day and needs to be updated")
                spiritOfTheDay = spirits.randomElement()
                UserDefaults.standard.set(spiritOfTheDay, forKey: "alcoholOfTheDay")
                UserDefaults.standard.set(date, forKey: "spiritDate")
            } else {
                print("This is todays spirit of the day")
                spiritOfTheDay = storedSpiritOfTheDay as? String
            }
        }
    }
}


