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
		
		if let url = recipe.photoUrlLarge {
			CachingAsyncImage(url: url) { image in
				image
					.resizable()
					.aspectRatio(contentMode: .fit)
					.cornerRadius(20)
			} placeholder: {
				Text("Loading Image...")
			} error: {
				EmptyView()
			}
		}
		
    }
	
}

#Preview {
	
	RecipePhotoView(recipe: .example)
	
}
