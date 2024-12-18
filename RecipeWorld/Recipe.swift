//
//  Recipe.swift
//  RecipeWorld
//
//  Created by Jason Turner on 12/12/24.
//

import Foundation

struct Recipe: Decodable {
	let cuisine: String
	let name: String
	let photoUrlLarge: URL?
	let photoUrlSmall: URL?
	let uuid: UUID
	let sourceUrl: URL?
	let youtubeUrl: URL?
}

extension Recipe {
	var hasPhoto: Bool { photoUrlLarge != nil || photoUrlSmall != nil }
}

extension Recipe: Identifiable {
	var id: UUID { uuid }
}

extension Recipe {
	
	static var example: Recipe {
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		let json = #"""
		{
			"cuisine": "British",
			"name": "Bakewell Tart",
			"photo_url_large": "https://www.thereciperebel.com/wp-content/uploads/2020/07/best-burgers-www.thereciperebel.com-1200-13-of-18.jpg",
			"uuid": "eed6005f-f8c8-451f-98d0-4088e2b40eb6",
			"source_url": "https://www.allrecipes.com",
			"youtube_url": "https://www.allrecipes.com",
		}
		"""#
		let data = json.data(using: .utf8)!
		let recipe = try! decoder.decode(Recipe.self, from: data)
		return recipe
	}
	
}
