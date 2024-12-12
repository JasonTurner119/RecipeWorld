//
//  RecipeDetailView.swift
//  RecipeWorld
//
//  Created by Jason Turner on 12/12/24.
//

import SwiftUI

struct RecipeDetailView: View {
	
	let recipe: Recipe
	
    var body: some View {
		
		ScrollView {
			VStack(alignment: .leading) {
				Text(recipe.cuisine)
				if recipe.hasPhoto {
					RecipePhotoView(recipe: recipe)
				}
			}
			.padding(.horizontal)
		}
		.navigationTitle(recipe.name)
		.navigationBarTitleDisplayMode(.large)
		
    }
	
}

#Preview {
	NavigationView {
		RecipeDetailView(recipe: .example)
	}
}
