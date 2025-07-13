//
//  ASAsyncImageView.swift
//  ASSocialHome1
//
//  Created by Paul F on 22/2/25.
//

import SwiftUI

//Paso 2.5
struct ASAsyncImageView: View {
    @State private var image: UIImage?
    
    private let source: ASImageSource
    private let notFoundImageAsset: String
    private let contentMode: ContentMode
    private let mustUseCache: Bool
    
    var body: some View {
        imageView
            .task(priority: .background) {
                switch source {
                    case .asset(let name):
                        image = UIImage(named: name)
                    case .remote(let url):
                        await self.fetchImage(with: url)
                    default:
                        break
                }
            }
    }
    
    var imageView: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .aspectRatio(contentMode: contentMode)
            } else {
                if case .systemName(let systemName) = source {
                    Image(systemName: systemName)
                } else {
                    ZStack {
                        Image(notFoundImageAsset)
                            .resizable()
                            .scaledToFill()
                            .aspectRatio(contentMode: contentMode)
                        ASBackgroundBlurView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        ProgressView().accentColor(.white)
                    }
                }
            }
        }
    }
    
    init(source: ASImageSource,
         notFoundImageAsset: String? = nil,
         contentMode: ContentMode = .fill,
         mustUseCache: Bool? = nil) {
        self.source = source
        self.notFoundImageAsset = notFoundImageAsset ?? "imageNotFound"
        self.contentMode = contentMode
        self.mustUseCache = mustUseCache ?? true
    }
}

extension ASAsyncImageView {
    private func fetchImage(with url: URL?) async {
        do {
            if let url {
                let downloadedImage = try await ImageHelper.downloadImage(url: url, mustUseCache: mustUseCache)
                await MainActor.run {
                    image = downloadedImage
                }
            } else {
                await MainActor.run {
                    image = UIImage(named: self.notFoundImageAsset)
                }
            }
        } catch {
            await MainActor.run {
                image = UIImage(named: notFoundImageAsset)
            }
        }
    }
}
