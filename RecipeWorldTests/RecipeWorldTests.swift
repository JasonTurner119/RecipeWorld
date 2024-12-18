//
//  RecipeWorldTests.swift
//  RecipeWorldTests
//
//  Created by Jason Turner on 12/12/24.
//

import Testing
import Foundation
@testable import RecipeWorld

struct RecipeWorldTests {

    @Test func recipeDecodingFull() throws {
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		let json = #"""
		{
			"cuisine": "British",
			"name": "Bakewell Tart",
			"photo_url_large": "https://some.url/large.jpg",
			"photo_url_small": "https://some.url/small.jpg",
			"uuid": "eed6005f-f8c8-451f-98d0-4088e2b40eb6",
			"source_url": "https://some.url/index.html",
			"youtube_url": "https://www.youtube.com/watch?v=some.id"
		}
		"""#
		let data = json.data(using: .utf8)!
		let recipe = try decoder.decode(Recipe.self, from: data)
		#expect(recipe.cuisine == "British")
		#expect(recipe.name == "Bakewell Tart")
		#expect(recipe.photoUrlLarge?.absoluteString == "https://some.url/large.jpg")
		#expect(recipe.photoUrlSmall?.absoluteString == "https://some.url/small.jpg")
		#expect(recipe.uuid.uuidString == "eed6005f-f8c8-451f-98d0-4088e2b40eb6".uppercased())
		#expect(recipe.sourceUrl?.absoluteString == "https://some.url/index.html")
		#expect(recipe.youtubeUrl?.absoluteString == "https://www.youtube.com/watch?v=some.id")
    }
	
	@Test func recipeDecodingMinimal() throws {
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		let json = #"""
		{
			"cuisine": "British",
			"name": "Bakewell Tart",
			"uuid": "eed6005f-f8c8-451f-98d0-4088e2b40eb6",
		}
		"""#
		let data = json.data(using: .utf8)!
		let recipe = try decoder.decode(Recipe.self, from: data)
		#expect(recipe.cuisine == "British")
		#expect(recipe.name == "Bakewell Tart")
		#expect(recipe.photoUrlLarge == nil)
		#expect(recipe.photoUrlSmall == nil)
		#expect(recipe.uuid.uuidString == "eed6005f-f8c8-451f-98d0-4088e2b40eb6".uppercased())
		#expect(recipe.sourceUrl == nil)
		#expect(recipe.youtubeUrl == nil)
	}
	
	@Test func imageLoader() async throws {
		let url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg")!
		let imageLoader = ImageLoader(url: url)
		await imageLoader.load()
		#expect(imageLoader.usedCache != nil)
		await imageLoader.load()
		#expect(imageLoader.usedCache == true)
	}
	
	@Test func successfulRecipeRetriver() async throws {
		let recipies = try await RecipeRetriever.shared.retrieveRecipes()
		#expect(recipies.count > 0)
	}
	
	@Test func malformedRecipeRetriver() async throws {
		await #expect(
			performing: {
				try await RecipeRetriever.malformed.retrieveRecipes()
			}, throws: { _ in
				true
			}
		)
	}
	
	@Test func emptyRecipeRetriver() async throws {
		let recipies = try await RecipeRetriever.empty.retrieveRecipes()
		#expect(recipies.count == 0)
	}

}
