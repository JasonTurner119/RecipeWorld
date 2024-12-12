//
//  RecipeWorldApp.swift
//  RecipeWorld
//
//  Created by Jason Turner on 12/12/24.
//

import SwiftUI

@main
struct RecipeWorldApp: App {

    var body: some Scene {
        WindowGroup {
			RecipeListView(recipes: Array(repeating: .example, count: 10))
        }
    }
	
}
