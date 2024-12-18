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
				sourceLink
				largePhoto
				youtubeLink
			}
			.padding(.horizontal)
		}
		.navigationTitle(recipe.name)
		.navigationBarTitleDisplayMode(.large)
		
    }
	
	@ViewBuilder
	private var sourceLink: some View {
		RecipeLinkView(
			url: recipe.sourceUrl,
			text: "Visit Source",
			image: Image(systemName: "link"),
			backgroundColor: .blue.opacity(0.5)
		)
	}
	
	@ViewBuilder
	private var largePhoto: some View {
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
	
	@ViewBuilder
	private var youtubeLink: some View {
		RecipeLinkView(
			url: recipe.youtubeUrl,
			text: "Watch the Video",
			image: Image(systemName: "video"),
			backgroundColor: .red.opacity(0.5)
		)
	}
	
}

#Preview {
	NavigationView {
		RecipeDetailView(recipe: .example)
	}
}
