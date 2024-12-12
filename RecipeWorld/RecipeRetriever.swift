//
//  RecipeRetriever.swift
//  RecipeWorld
//
//  Created by Jason Turner on 12/12/24.
//

import Foundation

struct RecipeRetriever {
	
	static let shared = RecipeRetriever(
		url: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")!
	)
	
	static let malformed = RecipeRetriever(
		url: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json")!
	)
	
	static let empty = RecipeRetriever(
		url: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json")!
	)
	
	private let url: URL
	
	private let decoder: JSONDecoder = {
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		return decoder
	}()
	
	func retrieveRecipes() async throws -> [Recipe] {
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
