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
				ForEach(recipes.indices, id: \.self) { index in
					let recipe = recipes[index]
					NavigationLink(destination: { RecipeView(recipe: recipe) }) {
						Text(recipe.name)
					}
				}
			}
			.navigationTitle("Recipes")
		}
    }
	
}

#Preview {
	RecipeListView(recipes: Array(repeating: .example, count: 4))
}
