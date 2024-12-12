//
//  RecipeListView.swift
//  RecipeWorld
//
//  Created by Jason Turner on 12/12/24.
//

import SwiftUI

struct RecipeListView: View {
	
	@State private var state: RecipeListViewState = .loading
	
    var body: some View {
		NavigationView {
			List {
				switch state {
				case .loading:
					Text("Loading...")
				case .error:
					Text("Error Loading Recipes")
				case .loaded(let recipes):
					ForEach(recipes) { recipe in
						recipeRow(recipe: recipe)
					}
				}
			}
			.navigationTitle("Recipes")
		}
		.task {
			do {
				let recipies = try await RecipeRetriever.shared.retrieveRecipes()
				state = .loaded(recipies)
			} catch {
				print(String(describing: error))
				state = .error
			}
		}
    }
	
	@ViewBuilder
	private func recipeRow(recipe: Recipe) -> some View {
		NavigationLink(destination: { RecipeDetailView(recipe: recipe) }) {
			RecipeThumbnailView(recipe: recipe)
		}
	}
	
}

extension RecipeListView {
	private enum RecipeListViewState {
		case loading
		case error
		case loaded([Recipe])
	}
}

#Preview {
	RecipeListView()
}
