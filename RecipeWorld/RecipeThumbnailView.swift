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
		HStack {
			Group {
				if let photoUrlSmall = recipe.photoUrlSmall {
					CachingAsyncImage(url: photoUrlSmall) { image in
						image
							.resizable()
					} placeholder: {
						ProgressView()
					} error: {
						EmptyView()
					}
				}
			}
			.aspectRatio(contentMode: .fit)
			.frame(width: 65, height: 65)
			.cornerRadius(10)
			Text(recipe.name)
		}
    }
	
}

#Preview {
	RecipeThumbnailView(recipe: .example)
}
