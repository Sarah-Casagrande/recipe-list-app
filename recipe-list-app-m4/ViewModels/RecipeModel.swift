//
//  RecipeModel.swift
//  recipe-list-app-m4
//
//  Created by Sarah Casagrande on 7/17/22.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        // Create an instance of data service and get data
        self.recipes = DataService.getLocalData()
    }
}
