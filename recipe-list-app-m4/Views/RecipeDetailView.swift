//
//  RecipeDetailView.swift
//  recipe-list-app
//
//  Created by Sarah Casagrande on 7/15/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    @State var servingSize = 2
    
    var body: some View {
        
        ScrollView {
            
            // MARK: Recipe Image
            Image(recipe.image)
                .resizable()
                .scaledToFill()
            
            // MARK: Serving Size Picker
            VStack(alignment: .leading) {
                Text("Select Your Serving Size:")
                Picker("Choose Serving", selection: $servingSize) {
                    Text("2").tag(2)
                    Text("4").tag(4)
                    Text("6").tag(6)
                    Text("8").tag(8)
                }.pickerStyle(SegmentedPickerStyle())
            }.padding()
            
            
            VStack(alignment: .leading) {
                
                // MARK: Ingredients
                
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.vertical)
                    ForEach(recipe.ingredients) { ingredient in
                        Text("• " + RecipeModel.getPortion(ingredient: ingredient, recipeServings: recipe.servings, targetServings: servingSize) + " " + ingredient.name.lowercased())
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
