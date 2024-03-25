//
//  HomeViewModel.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 3/21/24.
//

import Foundation


final class HomeViewModel: ObservableObject {
    
    @Published private(set) var spiritOfTheDayName: String?
    @Published private(set) var drinkOfTheDayName: String?
    @Published private(set) var drinkOfTheDay: Drink?
    @Published private(set) var popularDrinks: [Drink] = []
    @Published private(set) var newestDrinks: [Drink] = []
    @Published private(set) var randomDrink: [Drink] = []
    private var date: Date = Date.now
    
    
    func getSpiritOfTheDay() {

//        print("Inside SOTD")
        // 1. Check to see if there is a saved spirit of the day and date
        let storedSpiritOfTheDay = UserDefaults.standard.string(forKey: "spiritOfTheDay")
        let storedSpiritDate = UserDefaults.standard.object(forKey: "spiritDate")
        
//        if let storedSpiritOfTheDay = storedSpiritOfTheDay {
//            print("storedSpiritOfTheDay: ", storedSpiritOfTheDay)
//        }
//        
//        if let storedSpiritDate = storedSpiritDate {
//            print("spiritDate: ", storedSpiritDate)
//        }
        
        // 2. If not get a random spirit and save the spirit object
        if let storedSpiritOfTheDay = storedSpiritOfTheDay {
//            print("storedSpiritOfTheDay: ", storedSpiritOfTheDay)
            // 3. If there is, we need check to see if it is todays spirit
            if Calendar.current.isDate(date, equalTo: storedSpiritDate as! Date, toGranularity: .day) {
                // 4. If it is, spirit of the day stays the same
                let dateTest = Calendar.current.isDate(date, equalTo: storedSpiritDate as! Date, toGranularity: .day)
//                print("Date test: ", dateTest)
//                print("Date: ", date)
//                print("Stored date", storedSpiritDate ?? "No date")
//                print("Date check: ", Calendar.current.isDateInToday(date))
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
    
    func getDrinkOfTheDay() {
        clearUserData()

        print("Inside Drink of the Day!")
        // 1. Check to see if there is a saved drink of the day and date
        if let data = UserDefaults.standard.data(forKey: "Test") {
            print("Data: \(data)")
            dump(data)
            if let decodedData = try? JSONDecoder().decode(CocktailDBAPIResponse.self, from: data) {
                print("Drink of the day data: \(decodedData)")
                
            } else {
                print("Problem decoding drink of the day")
//                clearUserData()
            }
        } else {
            print("Problem getting data")
            getRandomDrink()
            print("Random drink is... \(randomDrink)")
            if let encoded = try? JSONEncoder().encode(randomDrink) {
                UserDefaults.standard.set(encoded, forKey: "Test")
                print("DOTD saved")
            }
        }
        
        func clearUserData() {
            UserDefaults.standard.removeObject(forKey: "Test")
            UserDefaults.standard.removeObject(forKey: "DrinkOfTheDay")
            print("User defaults should be deleted")
        }

//        let storedDrinkOfTheDay = UserDefaults.standard.object(forKey: "drinkOfTheDay")
//        let storedDrinkDate = UserDefaults.standard.object(forKey: "drinkDate")
//        
//        if storedDrinkOfTheDay != nil {
//            print("storedDrinkOfTheDay: ", storedDrinkOfTheDay)
//        }
//        
//        if let storedDrinkDate = storedDrinkDate {
//            print("drinkDate: ", storedDrinkDate)
//        }
//        
//        // 2. If there is a stored drink of the day
//        if let storedDrinkOfTheDay = storedDrinkOfTheDay {
//            print("storedDrinkOfTheDay: ", storedDrinkOfTheDay)
//            // 3. Check the saved drink date to see if it is still the current day
//            if Calendar.current.isDate(date, equalTo: storedDrinkDate as! Date, toGranularity: .day) {
//                // 4. If it is, drink of the day stays the same
//                let dateTest = Calendar.current.isDate(date, equalTo: storedDrinkDate as! Date, toGranularity: .day)
//                print("Date test: ", dateTest)
//                print("Date: ", date)
//                print("Stored drink date", storedDrinkDate ?? "No date")
//                print("Date check: ", Calendar.current.isDateInToday(date))
//                drinkOfTheDay = storedDrinkOfTheDay as Drink
//            } else {
//                // 5. If it is not, get a new random drink and save
//                getRandomDrink()
//                drinkOfTheDayName = randomDrink.first?.name
//                UserDefaults.standard.set(drinkOfTheDayName, forKey: "drinkOfTheDay")
//                UserDefaults.standard.set(date, forKey: "spiritDate")
//            }
//        } else {
//            //6.  If there is no stored drink of the day make the API call to get one
//            spiritOfTheDayName = spirits.randomElement()
//            UserDefaults.standard.set(spiritOfTheDayName, forKey: "drinkOfTheDay")
//            UserDefaults.standard.set(date, forKey: "drinkDate")
//        }
    }
    
    func getPopularDrinks() {
        // 1. Get the api key from config file
        if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
            
            // 2. Make the network request
            NetworkingManager.shared.request("https://www.thecocktaildb.com/api/json/v2/\(apiKey)/popular.php", type: CocktailDBAPIResponse.self) { res in
                DispatchQueue.main.async {
                    switch res {
                        // 3. update the array with the data
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
    
    func getNewestDrinks() {
        // 1. Get the api key from config file
        if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
            
            // 2. Make the network request
            NetworkingManager.shared.request("https://www.thecocktaildb.com/api/json/v2/\(apiKey)/latest.php", type: CocktailDBAPIResponse.self) { res in
                DispatchQueue.main.async {
                    switch res {
                        // 3. update the array with the data
                    case .success(let data):
                        self.newestDrinks = data.drinks
                        print("Newest drinks", self.newestDrinks)
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        } else {
            print("Something went wrong")
        }
    }
    
    func getRandomDrink() {
        // 1. Get the api key from config file
        if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
            
            // 2. Make the network request
            NetworkingManager.shared.request("https://www.thecocktaildb.com/api/json/v2/\(apiKey)/random.php", type: CocktailDBAPIResponse.self) { res in
                DispatchQueue.main.async {
                    switch res {
                        // 3. update the array with the data
                    case .success(let data):
                        self.randomDrink = data.drinks
                        print("Random drink", self.randomDrink)
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        } else {
            print("Something went wrong getting a random drink")
        }
    }
}


