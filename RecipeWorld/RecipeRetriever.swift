//
//  RecipeRetriever.swift
//  RecipeWorld
//
//  Created by Jason Turner on 12/12/24.
//

import Foundation

struct RecipeRetriever {
	
	static let shared = RecipeRetriever()
	
	private init() {}
	
	private let decoder: JSONDecoder = {
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		return decoder
	}()
	
	func retrieveRecipes() async throws -> [Recipe] {
		let url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")!
		let (data, _) = try await URLSession.shared.data(from: url)
		let recipeList = try decoder.decode(RecipeList.self, from: data)
		return recipeList.recipes
	}
	
}

extension RecipeRetriever {
	private struct RecipeList: Decodable {
		let recipes: [Recipe]
	}
}
