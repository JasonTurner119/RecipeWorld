//
//  RecipeLinkView.swift
//  RecipeWorld
//
//  Created by Jason Turner on 12/12/24.
//

import SwiftUI

struct RecipeLinkView: View {
	
	let recipe: Recipe
	
    var body: some View {
		
		if let url = recipe.sourceUrl {
			
			Link(destination: url) {
				HStack {
					Spacer()
					HStack {
						Image(systemName: "link")
						Text("Visit the Source")
					}
					.padding()
					Spacer()
				}
				.foregroundStyle(.black)
				.background(Color.accentColor)
				.cornerRadius(15)
			}
			
		}
		
    }
	
}

#Preview {
	RecipeLinkView(recipe: .example)
}
