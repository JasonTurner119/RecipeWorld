//
//  RecipeLinkView.swift
//  RecipeWorld
//
//  Created by Jason Turner on 12/12/24.
//

import SwiftUI

struct RecipeLinkView: View {
	
	var url: URL?
	var text: String
	var image: Image?
	var backgroundColor: Color?
	
    var body: some View {
		
		if let url {
			
			Link(destination: url) {
				HStack {
					Spacer()
					HStack {
						if let image { image }
						Text(text)
					}
					.padding()
					Spacer()
				}
				.foregroundStyle(.black)
				.background(backgroundColor ?? .accentColor)
				.cornerRadius(15)
			}
			
		}
		
    }
	
}

#Preview {
	RecipeLinkView(
		url: URL(string: "www.google.com"),
		text: "Google",
		image: Image(systemName: "link")
	)
}
