//
//  CachingAsyncImage.swift
//  RecipeWorld
//
//  Created by Jason Turner on 12/12/24.
//

import SwiftUI

struct CachingAsyncImage<Content: View, Placeholder: View>: View {
	
	@StateObject private var imageLoader: ImageLoader
	
	private let content: (Image) -> Content
	private let placeholder: () -> Placeholder
	
	init(
		url: URL,
		@ViewBuilder content: @escaping (Image) -> Content,
		@ViewBuilder placeholder: @escaping () -> Placeholder
	) {
		self._imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
		self.content = content
		self.placeholder = placeholder
	}
	
    var body: some View {
		Group {
			switch imageLoader.state {
			case .loading, .error:
				placeholder()
			case .loaded(let image):
				content(image)
			}
		}
		.task {
			await imageLoader.load()
		}
    }
	
}

