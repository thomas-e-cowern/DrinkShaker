//
//  HomeViewModel.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 3/21/24.
//

import Foundation


final class HomeViewModel: ObservableObject {
    
    @Published private(set) var spiritOfTheDayName: String?
    @Published private(set) var popularDrinks: [Drink] = []
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
            if Calendar.current.isDate(date, equalTo: storedSpiritDate as! Date, toGranularity: .day) {
                // 4. If it is, spirit of the day stays the same
                let dateTest = Calendar.current.isDate(date, equalTo: storedSpiritDate as! Date, toGranularity: .day)
                print("Date test: ", dateTest)
                print("Date: ", date)
                print("Stored date", storedSpiritDate ?? "No date")
                print("Date check: ", Calendar.current.isDateInToday(date))
                spiritOfTheDayName = storedSpiritOfTheDay
            } else {
                // 5. If it is not, get a new random spirit and save
                spiritOfTheDayName = spirits.randomElement()
                UserDefaults.standard.set(spiritOfTheDayName, forKey: "spiritOfTheDay")
                UserDefaults.standard.set(date, forKey: "spiritDate")
            }
        } else {
            //6.  If not spirit of the day, get one and save to user defaults
            spiritOfTheDayName = spirits.randomElement()
            UserDefaults.standard.set(spiritOfTheDayName, forKey: "spiritOfTheDay")
            UserDefaults.standard.set(date, forKey: "spiritDate")
        }
    }
    
    func getPopularDrinks() {
        
        if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
            NetworkingManager.shared.request("https://www.thecocktaildb.com/api/json/v2/\(apiKey)/popular.php", type: CocktailDBAPIResponse.self) { res in
                DispatchQueue.main.async {
                    switch res {
                    case .success(let data):
                        self.popularDrinks = data.drinks
                        print("Popular drinks", self.popularDrinks)
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        } else {
            print("Something went wrong")
        }
        
        
    }
}


