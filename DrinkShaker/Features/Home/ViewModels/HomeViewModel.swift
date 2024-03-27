//
//  HomeViewModel.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 3/21/24.
//

import Foundation


final class HomeViewModel: ObservableObject {
    
    @Published private(set) var spiritOfTheDayName: String?
    @Published private(set) var randomDrink: Drink?
    @Published private(set) var drinkOfTheDay: Drink?
    
    @Published private(set) var error: NetworkingManager.NetworkingError?
    @Published var hasError = false
    
    private var date: Date = Date.now
    
    
    // MARK: Get spirit of the day
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
    
    // MARK: Get drinkg of the day
    func getDrinkOfTheDay() async {

        let drinkData = UserDefaults.standard.data(forKey: "DrinkOfTheDay")
        let drinkDate = UserDefaults.standard.data(forKey: "DrinkOfTheDayDate")
        var updatedDate: Date = Date.now
        var storedDrinkOfTheDay: Drink?
        // 1. check to see if there is a store drink of the day
        if let drinkData = drinkData {
            print("we have a stored DOTD")

                storedDrinkOfTheDay = customDecoder(data: drinkData, type: Drink.self)

            // 2. check to see if there is a stored date
            if let drinkDate = drinkDate {
                print("We have a stored date")
                
                // 3. decode the stored date
                updatedDate = customDecoder(data: drinkDate, type: Date.self) ?? Date.now

                // 4.  check to see if the day is the same, if it is used the stored date
                if Calendar.current.isDate(date, equalTo: updatedDate , toGranularity: .day) {
                    print("Hurray, Today!")
                    drinkOfTheDay = storedDrinkOfTheDay
                }
            } else {
                print("We have no stored date")
            }

        } else {
            print("we do not have a stored DOTD")
            // 1. get a random drink
            let newDrinkOfTheDay = await getRandomDrink()
            
            if let newDrinkOfTheDay = newDrinkOfTheDay {
                print("newDrinkOfTheDay: \(newDrinkOfTheDay)")
            }
            // 2. save to user defaults for 24 hours
            
            do {
                let encoder = JSONEncoder()
                
                let data = try encoder.encode(newDrinkOfTheDay)
                
                UserDefaults.standard.set(data, forKey: "DrinkOfTheDay")
                print("New drink of the day should be saved")
            } catch {
                print("Unable to Encode DOTD (\(error))")
            }
             // encode the date
            do {
                let encoder = JSONEncoder()
                
                let data = try encoder.encode(date)
                
                
                UserDefaults.standard.set(data, forKey: "DrinkOfTheDayDate")
                print("New drink of the day date should be saved")
            } catch {
                print("Unable to Encode DOTD (\(error))")
            }
        }
        
        // MARK: Custom decoder
        func customDecoder<T: Decodable>(data: Data, type: T.Type) -> T? {
            var result: T
            let decoder = JSONDecoder()
            
            do {
                result = try decoder.decode(T.self, from: data)
                print("Result from customDecoder: \(result)")
                return result
            } catch {
                print("Error in customDecoder; \(error)")
            }
            return nil
        }
        
        // clear user data for testing
        func clearUserData() {
            UserDefaults.standard.removeObject(forKey: "Test")
            UserDefaults.standard.removeObject(forKey: "DrinkOfTheDay")
            print("User defaults should be deleted")
        }
    }
    
    // MARK: Get random drink
    func getRandomDrink() async -> Drink? {
        // 1. Get the api key from config file
        if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
            print("Get a random drink")
            // 2. Make the network request
            do {
                let newDrink = try await NetworkingManager.shared.request(.randomDrink(apiKey: apiKey), type: CocktailDBAPIResponse.self).drinks.first!
                return newDrink
                
            } catch {
                print("Problem in get random drink")
            }
        } else {
            print("Something went wrong getting a random drink")
        }
        
        return nil
    }
}
