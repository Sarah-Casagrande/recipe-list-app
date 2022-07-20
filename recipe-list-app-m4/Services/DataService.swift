//
//  DataService.swift
//  recipe-list-app-m4
//
//  Created by Sarah Casagrande on 7/17/22.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else {
            return [Recipe]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the unique IDs
                for recipe in recipeData {
                    recipe.id = UUID()
                    
                    for i in recipe.ingredients {
                        i.id = UUID()
                    }
                }
                
                // Return the recipes
                return recipeData
                
            } catch {
                print(error)
            }
            
        } catch {
            print(error)
        }
        return [Recipe]()
    }
    
}
