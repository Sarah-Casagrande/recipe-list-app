//
//  RecipeDetailView.swift
//  recipe-list-app
//
//  Created by Sarah Casagrande on 7/15/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        
        ScrollView {
            
            // MARK: Recipe Image
            Image(recipe.image)
                .resizable()
                .scaledToFill()
            
            VStack(alignment: .leading) {
                
                // MARK: Ingredients
            
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.vertical)
                    ForEach(recipe.ingredients) { ingredient in
                        Text("• " + ingredient.name)
                            .padding(.bottom, 1.0)
                    }
                }
                .padding(.bottom)
                
                // MARK: Divider
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.vertical)
                    ForEach(0..<recipe.directions.count, id: \.self) {direction in
                        Text(String(direction+1) + ". " + recipe.directions[direction])
                            .padding(.bottom, 2.0)
                    }
                }
            }
            .padding(.horizontal)
            
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe to see a preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
