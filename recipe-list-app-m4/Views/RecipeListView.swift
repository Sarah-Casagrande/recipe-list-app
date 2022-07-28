//
//  RecipeListView.swift
//  recipe-list-app
//
//  Created by Sarah Casagrande on 7/15/22.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                Text("All Recipes")
                    .bold()
                    .padding(.top, 40)
                    .font(Font.custom("Avenir Heavy", size: 36))
                
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach (model.recipes) { recipe in
                            
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
                                        VStack(alignment: .leading) {
                                            Text(recipe.name)
                                                .foregroundColor(.black)
                                                .bold()
                                            RecipeHighlights(highlights: recipe.highlights)
                                                .foregroundColor(.black)
                                        }
                                    }
                                })
                            
                        }.navigationBarHidden(true)
                    }
                }
            }.padding(.leading)
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}

