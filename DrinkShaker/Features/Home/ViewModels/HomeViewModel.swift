//
//  HomeViewModel.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 3/21/24.
//

import Foundation


final class HomeViewModel: ObservableObject {
    
    private var spiritOfTheDayName: String?
    @Published private(set) var spiritOfTheDay: Ingredients?
    private var date: Date = Date.now
    
    func getSpiritOfTheDay() {
        
        let storedSpiritOfTheDay = UserDefaults.standard.object(forKey: "alcoholOfTheDay")
        let storedSpiritDate = UserDefaults.standard.object(forKey: "spiritDate")
        print("storedSpiritOfTheDay: ", storedSpiritOfTheDay ?? "No spirit today")
        print("spiritDate: ", storedSpiritDate ?? "No spirit date")
        print(Calendar.current.isDateInToday(date))
        if storedSpiritOfTheDay == nil {
            print("store spirit is nil")
            spiritOfTheDayName = spirits.randomElement()
            print("spiritOfTheDayName: ", spiritOfTheDayName as Any)
            UserDefaults.standard.set(spiritOfTheDay, forKey: "alcoholOfTheDay")
            UserDefaults.standard.set(date, forKey: "spiritDate")
        } else {
            print("We have a spirit in user data")
            
            if Calendar.current.isDateInToday(date) {
                print("This is todays spirit of the day")
                spiritOfTheDayName = storedSpiritOfTheDay as? String
            } else {
                print("This is from a previous day and needs to be updated")
                spiritOfTheDayName = spirits.randomElement()
                UserDefaults.standard.set(spiritOfTheDay, forKey: "alcoholOfTheDay")
                UserDefaults.standard.set(date, forKey: "spiritDate")
            }
        }
        if let spiritOfTheDayName = spiritOfTheDayName {
            NetworkingManager.shared.request("https://www.thecocktaildb.com/api/json/v2/1/search.php?i=\(spiritOfTheDayName)", type: Ingredients.self) { res in
                switch res {
                case .success(let data):
                    self.spiritOfTheDay = data
                    print("SOTD: ", self.spiritOfTheDay ?? "No SOTD")
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}


