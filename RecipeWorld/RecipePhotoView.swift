//
//  RecipePhotoView.swift
//  RecipeWorld
//
//  Created by Jason Turner on 12/12/24.
//

import SwiftUI

struct RecipePhotoView: View {
	
	let recipe: Recipe
	
    var body: some View {
		
		let url = recipe.photoUrlLarge ?? recipe.photoUrlSmall
		
		AsyncImage(url: url) { image in
			image
				.resizable()
				.aspectRatio(contentMode: .fit)
				.cornerRadius(20)
		} placeholder: {
			Text("Loading Image...")
		}
		
    }
	
}

#Preview {
	
	RecipePhotoView(recipe: .example)
	
}
