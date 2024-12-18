//
//  CachingAsyncImage.swift
//  RecipeWorld
//
//  Created by Jason Turner on 12/12/24.
//

import SwiftUI

struct CachingAsyncImage<Content: View, Placeholder: View, ErrorView: View>: View {
	
	@StateObject private var imageLoader: ImageLoader
	
	private let content: (Image) -> Content
	private let placeholder: () -> Placeholder
	private let errorView: () -> ErrorView
	
	init(
		url: URL,
		@ViewBuilder content: @escaping (Image) -> Content,
		@ViewBuilder placeholder: @escaping () -> Placeholder,
		@ViewBuilder error: @escaping () -> ErrorView
	) {
		self._imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
		self.content = content
		self.placeholder = placeholder
		self.errorView = error
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

