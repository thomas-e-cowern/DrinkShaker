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
    @Published private(set) var randomDrink: [Drink] = []
    @Published private(set) var drinkOfTheDay: CocktailDBAPIResponse?
    
    @Published private(set) var error: NetworkingManager.NetworkingError?
    @Published var hasError = false
    
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
//                let dateTest = Calendar.current.isDate(date, equalTo: storedSpiritDate as! Date, toGranularity: .day)
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
    
    func getDrinkOfTheDay() async {
        
        print("Inside DOTD")
        
        await getRandomDrink()
        
//        if let data = UserDefaults.standard.data(forKey: "DrinkOfTheDay") {
//            do {
//                let decoder = JSONDecoder()
//                print("Decoding DOTD")
//                drinkOfTheDay = try decoder.decode([CocktailDBAPIResponse].self, from: data)
//                
//                print("DOTD from data: \(String(describing: drinkOfTheDay))")
//                
//            } catch {
//                print("Unable to Decode DOTD (\(error))")
//            }
//        } else {
//
////                getRandomDrink()
//            
//            do {
//                let newDrink = randomDrink
//                
//                let encoder = JSONEncoder()
//                
//                let data = try encoder.encode(newDrink)
//                
//                UserDefaults.standard.set(data, forKey: "DrinkOfTheDay")
//            } catch {
//                print("Unable to Encode DOTD (\(error))")
//            }
//        }
        
//        getRandomDrink()
        
        do {
            let newDrink = randomDrink
            
            let encoder = JSONEncoder()
            
            let data = try encoder.encode(newDrink)
            
            UserDefaults.standard.set(data, forKey: "DrinkOfTheDay")
        } catch {
            print("Unable to Encode DOTD (\(error))")
        }
        

//        let storedDrinkOfTheDay = UserDefaults.standard.string(forKey: "DrinkOfTheDay")
//        let storedDrinkDate = UserDefaults.standard.object(forKey: "DrinkDate")
//        
//        if let storedDrinkOfTheDay = storedDrinkOfTheDay {
//            if Calendar.current.isDate(date, equalTo: storedDrinkDate as! Date, toGranularity: .day) {
//                drinkOfTheDayName = storedDrinkOfTheDay
//            }
//        } else {
//            if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
//                
//                // 2. Make the network request
//                NetworkingManager.shared.request(.randomDrink(apiKey: apiKey), type: CocktailDBAPIResponse.self) { [weak self] res in
//                    DispatchQueue.main.async {
//                        switch res {
//                            // 3. update the array with the data
//                        case .success(let data):
//                            self?.drinkOfTheDayName = data.drinks.first?.name
//    //                        print("Random drink", self?.randomDrink ?? "No random drink")
//                        case .failure(let error):
//                            print(error)
//                            self?.hasError = true
//                            self?.error = error as? NetworkingManager.NetworkingError
//                        }
//                    }
//                }
//                
//                UserDefaults.standard.set(drinkOfTheDayName, forKey: "drinkOfTheDay")
//                UserDefaults.standard.set(date, forKey: "drinkDate")
//            } else {
//                if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
//                    
//                    // 2. Make the network request
//                    NetworkingManager.shared.request(.randomDrink(apiKey: apiKey), type: CocktailDBAPIResponse.self) { [weak self] res in
//                        DispatchQueue.main.async {
//                            switch res {
//                                // 3. update the array with the data
//                            case .success(let data):
//                                self?.drinkOfTheDayName = data.drinks.first?.name
//                                //                        print("Random drink", self?.randomDrink ?? "No random drink")
//                            case .failure(let error):
//                                print(error)
//                                self?.hasError = true
//                                self?.error = error as? NetworkingManager.NetworkingError
//                            }
//                        }
//                    }
//                    
//                    UserDefaults.standard.set(drinkOfTheDayName, forKey: "drinkOfTheDay")
//                    UserDefaults.standard.set(date, forKey: "drinkDate")
//                }
//            }
//        }
       
        func clearUserData() {
            UserDefaults.standard.removeObject(forKey: "Test")
            UserDefaults.standard.removeObject(forKey: "DrinkOfTheDay")
            print("User defaults should be deleted")
        }
    }
        
    func getRandomDrink() async {
        // 1. Get the api key from config file
        if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
            print("Get ar random drink")
            // 2. Make the network request
            do {
                let test = try await NetworkingManager.shared.request(.randomDrink(apiKey: apiKey), type: CocktailDBAPIResponse.self)
                print("res: \(String(describing: test))")
            } catch {
                print("Problem in get random drink")
            }
        } else {
            print("Something went wrong getting a random drink")
        }
    }
}


