//
//  HomeViewModel.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 3/21/24.
//

import Foundation


final class HomeViewModel: ObservableObject {
    
    @Published private(set) var spiritOfTheDay: Ingredient?
    @Published private(set) var randomDrink: Drink?
    @Published private(set) var drinkOfTheDay: Drink?
    
    @Published private(set) var error: NetworkingManager.NetworkingError?
    @Published var hasError = false
    
    private var date: Date = Date.now
    
    // true if spirit of the day has already been called
    var currentSpiritOfTheDay: Bool {
        if let data = UserDefaults.standard.object(forKey: "spiritDate") as? Data {
            print("there is a stored spirit date")
            let decodedDate = customDecoder(data: data, type: Date.self)
            
            // if the date is today, return true, else if the date is in the past return false
            if Calendar.current.isDate(date, equalTo: decodedDate!, toGranularity: .day) {
                print("currentSpiritOfTheDay: This is today")
                return true
            } else if date > decodedDate! {
                print("currentSpiritOfTheDay: This date is younger: \(String(describing: decodedDate))")
                return false
            }
        }
        
        // Default return is false
        return false
    }
    
    // true if there is a stored spirit name
    var currentSpiritName: Bool {
        
        if UserDefaults.standard.data(forKey: "spiritOfTheDay") != nil {
            print("SOTD is not null")
            return true
        }  else {
            print("SOTD is null")
            return false
        }
    }
    
    
    // MARK: Get spirit of the day
    @MainActor
    func getSpiritOfTheDay() async {
        
        // Use currentSpiritOfTheDay to check if called already today
        if currentSpiritName {
                print("getSpiritOfTheDay: has been called already today")
            if currentSpiritOfTheDay {
                if let data = UserDefaults.standard.data(forKey: "spiritOfTheDay") {
                        self.spiritOfTheDay = self.customDecoder(data: data, type: Ingredient.self)

                }  else {
                    print("getSpiritOfTheDay: Error getting Current SOTD: \(String(describing: self.error?.localizedDescription))")
                }
            }
        } else {

                print("getSpiritOfTheDay: SOTD has not been called today")
                // 1. check to see if there is a store SOTD
                if UserDefaults.standard.data(forKey: "spiritOfTheDay") != nil {
                    print("getSpiritOfTheDay: there is a stored spirit of the day")
                    if let spiritOfTheDayName = spirits.randomElement() {
                        print("getSpiritOfTheDay: new spirit of the day: \(String(describing: spiritOfTheDayName))")
                        let result = await getIngredientDetails(name: spiritOfTheDayName)
                        customEncoder(data: result, key: "spiritOfTheDay")

                        customEncoder(data: Date(), key: "spiritDate")

                            self.spiritOfTheDay = result

                    }

                } else {
                    // 3. if no stored spirit of the day, get a new spirit of the day and store it and the new date
                    print("getSpiritOfTheDay: There is no stored spirit of the day")
                    if let spiritOfTheDayName = spirits.randomElement() {
                        print("new spirit of the day: \(String(describing: spiritOfTheDayName))")
                        let result = await getIngredientDetails(name: spiritOfTheDayName)
                        customEncoder(data: result, key: "spiritOfTheDay")
                        let date = Date.now
                        print("getSpiritOfTheDay: The new date is \(date)")
                        customEncoder(data: date, key: "spiritDate")
                            self.spiritOfTheDay = result
                    }
                }
        }
        
        func clearUserData() {
            UserDefaults.standard.removeObject(forKey: "spiritDate")
            UserDefaults.standard.removeObject(forKey: "spiritOfTheDay")
            print("User defaults for SOTD should be deleted")
        }
    }
    
    // MARK: Get drinkg of the day
    @MainActor
    func getDrinkOfTheDay() async {
        
        let drinkData = UserDefaults.standard.data(forKey: "DrinkOfTheDay")
        let drinkDate = UserDefaults.standard.data(forKey: "DrinkOfTheDayDate")
        var updatedDate: Date = Date.now
        var storedDrinkOfTheDay: Drink?
        // 1. check to see if there is a store drink of the day
        if let drinkData = drinkData {
            print("getDrinkOfTheDay: we have a stored DOTD")
            
            storedDrinkOfTheDay = customDecoder(data: drinkData, type: Drink.self)
            
            // 2. check to see if there is a stored date
            if let drinkDate = drinkDate {
                print("getDrinkOfTheDay: We have a stored date")
                
                // 3. decode the stored date
                updatedDate = customDecoder(data: drinkDate, type: Date.self) ?? Date.now
                
                // 4.  check to see if the day is the same, if it is used the stored date
                if Calendar.current.isDate(date, equalTo: updatedDate , toGranularity: .day) {
                    print("getDrinkOfTheDay: Hurray, Today!")

                    drinkOfTheDay = storedDrinkOfTheDay

                    
                } else {
                    print("getDrinkOfTheDay: Yeah it's a new day!")
                    // 1. get a random drink
                    let newDrinkOfTheDay = await getRandomDrink()
                    
                    if let newDrinkOfTheDay = newDrinkOfTheDay {
                        print("getDrinkOfTheDay: newDrinkOfTheDay: \(newDrinkOfTheDay)")
                    }
                    
                    drinkOfTheDay = newDrinkOfTheDay
                    // 2. save to user defaults for 24 hours
                    
                    do {
                        let encoder = JSONEncoder()
                        
                        let drinkData = try encoder.encode(newDrinkOfTheDay)
                        let dateData = try encoder.encode(date)
                        
                        UserDefaults.standard.set(drinkData, forKey: "DrinkOfTheDay")
                        print("New drink of the day should be saved")
                        UserDefaults.standard.set(dateData, forKey: "DrinkOfTheDayDate")
                        print("New drink of the day date should be saved")
                    } catch {
                        print("Unable to Encode DOTD (\(error))")
                    }
                }
            } else {
                print("getDrinkOfTheDay: We have no stored date")
            }
            
        } else {
            print("getDrinkOfTheDay: we do not have a stored DOTD")
            // 1. get a random drink
            let newDrinkOfTheDay = await getRandomDrink()
            
            if let newDrinkOfTheDay = newDrinkOfTheDay {
                drinkOfTheDay = newDrinkOfTheDay
                print("newDrinkOfTheDay: \(newDrinkOfTheDay)")
            }
            // 2. save to user defaults for 24 hours
            
            do {
                let encoder = JSONEncoder()
                
                let drinkData = try encoder.encode(newDrinkOfTheDay)
                let dateData = try encoder.encode(date)
                
                UserDefaults.standard.set(drinkData, forKey: "DrinkOfTheDay")
                print("New drink of the day should be saved")
                UserDefaults.standard.set(dateData, forKey: "DrinkOfTheDayDate")
                print("New drink of the day date should be saved")
            } catch {
                print("Unable to Encode DOTD (\(error))")
            }
        }
        
        // clear user data for testing
        func clearUserData() {
            UserDefaults.standard.removeObject(forKey: "DrinkOfTheDayDate")
            UserDefaults.standard.removeObject(forKey: "DrinkOfTheDay")
            print("User defaults for DOTD should be deleted")
        }
    }
    
    // MARK: Get random drink
    func getRandomDrink() async -> Drink? {
        // 1. Get the api key from config file
        if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
//            print("Get a random drink")
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
    
    // MARK: Get Ingredient Details
    func getIngredientDetails(name: String) async -> Ingredient? {
        print("getting ingredient details")
        // 1. Get the api key from config file
        if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
            
            do {
                let ingredients = try await NetworkingManager.shared.request(.spiritDetail(apiKey: apiKey, searchTerm: name), type: Ingredients.self).ingredients.first!
                return ingredients
            } catch {
                print("Problem getting ingredient details")
            }
            
        } else {
            print("problem with api key in get ingredient details")
        }
        return nil
    }
    
    // MARK: Custom decoder
    func customDecoder<T: Decodable>(data: Data, type: T.Type) -> T? {
        var result: T
        let decoder = JSONDecoder()
        
        do {
            result = try decoder.decode(T.self, from: data)
            return result
        } catch {
            print("Error in customDecoder; \(error)")
        }
        return nil
    }
    
    // MARK: Custom encoder
    func customEncoder(data: Encodable, key: String) {
        let encoder = JSONEncoder()
        
        do {
            let encodedData = try encoder.encode(data)
            UserDefaults.standard.set(encodedData, forKey: key)
            print("data: \(data) has been saved for key: \(key)")
            
        } catch {
            print("Error in customEncoder; \(error)")
        }
    }
}
