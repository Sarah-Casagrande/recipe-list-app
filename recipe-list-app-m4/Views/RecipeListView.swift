//
//  RecipeListView.swift
//  recipe-list-app
//
//  Created by Sarah Casagrande on 7/15/22.
//

import SwiftUI

struct RecipeListView: View {
    
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        
        NavigationView {
            List (model.recipes) { recipe in
                
                NavigationLink(
                    destination: RecipeDetailView(recipe: recipe),
                    label: {
                    HStack(spacing: 20.0) {
                        Image(recipe.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50, alignment: .center)
                            .clipped()
                            .cornerRadius(5)
                        Text(recipe.name)
                    }
                })

            }.navigationBarTitle("All Recipes")
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}

