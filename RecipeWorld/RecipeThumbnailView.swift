//
//  RecipeThumbnailView.swift
//  RecipeWorld
//
//  Created by Jason Turner on 12/12/24.
//

import SwiftUI

struct RecipeThumbnailView: View {
	
	let recipe: Recipe
	
    var body: some View {
		Text(recipe.name)
    }
	
}

#Preview {
	RecipeThumbnailView(recipe: .example)
}
