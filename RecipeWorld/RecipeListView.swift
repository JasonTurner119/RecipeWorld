//
//  RecipeListView.swift
//  RecipeWorld
//
//  Created by Jason Turner on 12/12/24.
//

import SwiftUI

struct RecipeListView: View {
	
	let recipes: [Recipe]
	
    var body: some View {
		NavigationView {
			List {
				if recipes.isEmpty {
					Text("No Recipes Found.")
				} else {
					ForEach(recipes.indices, id: \.self) { index in
						RecipeListView.recipeRow(recipe: recipes[index])
					}
				}
			}
			.navigationTitle("Recipes")
		}
    }
	
	@ViewBuilder
	private static func recipeRow(recipe: Recipe) -> some View {
		NavigationLink(destination: { RecipeDetailView(recipe: recipe) }) {
			RecipeThumbnailView(recipe: recipe)
		}
	}
	
}

#Preview {
	RecipeListView(recipes: Array(repeating: .example, count: 4))
}
