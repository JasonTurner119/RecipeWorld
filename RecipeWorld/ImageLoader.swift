//
//  ImageLoader.swift
//  RecipeWorld
//
//  Created by Jason Turner on 12/12/24.
//

import SwiftUI

class ImageLoader: ObservableObject {
	
	static private let cache = URLCache(
		memoryCapacity: 100 * Constants.megaByte,
		diskCapacity: 500 * Constants.megaByte
	)
	
	let url: URL
	@Published var state: ImageLoaderState = .loading
	private(set) var usedCache: Bool? = nil
	
	init(url: URL) {
		self.url = url
	}
	
	@MainActor
	func load() async {
		do {
			self.usedCache = nil
			let (image, usedCache) = try await getImage()
			self.usedCache = usedCache
			self.state = .loaded(image)
		} catch {
			print(String(describing: error))
			state = .error
		}
	}
	
	private func getImage() async throws -> (image: Image, usedCache: Bool) {
		let request = URLRequest(url: url)
		let cachedData = ImageLoader.cache.cachedResponse(for: request)?.data
		if let cachedData, let cachedImage = image(from: cachedData) {
			return (cachedImage, usedCache: true)
		} else {
			let (data, response) = try await URLSession.shared.data(for: request)
			guard let image = image(from: data) else {
				throw ImageLoaderError.invlaidImageData
			}
			let cahcedResponse = CachedURLResponse(response: response, data: data)
			ImageLoader.cache.storeCachedResponse(cahcedResponse, for: request)
			return (image, usedCache: false)
		}
	}
	
	private func image(from data: Data) -> Image? {
		return UIImage(data: data).map(Image.init(uiImage:))
	}
	
}

extension ImageLoader {
	enum ImageLoaderState {
		case loading
		case loaded(Image)
		case error
	}
}

extension ImageLoader {
	private enum Constants {
		static let megaByte = 1024 * 1024
	}
}

extension ImageLoader {
	private enum ImageLoaderError: Error {
		case invlaidImageData
		var localizedDescription: String {
			switch self {
			case .invlaidImageData:
				return "Invalid image data."
			}
		}
	}
}
