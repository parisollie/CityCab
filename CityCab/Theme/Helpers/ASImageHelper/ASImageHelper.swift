//
//  ASImageHelper.swift
//  ASSocialHome1
//
//  Created by Paul F on 22/2/25.
//

import UIKit

enum ImageError: Error {
    case downloadFailed
}

let serialQueueImageHelper = DispatchQueue(label: "com.alisonstudio.imagehelper")

struct ImageHelper {
     static func downloadImage(url: URL, mustUseCache: Bool) async throws -> UIImage {
        let cache: ASNSCacheStore = ASNSCacheStore<String,UIImage>.shared
        
        if mustUseCache {
            // Check if the image is already cached
            if let cachedImage = cache[url.absoluteString] {
                return cachedImage
            }
        }
        
        // Download the image if not cached
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let image = UIImage(data: data) {
                if mustUseCache {
                    // Cache the downloaded image
                    cache[url.absoluteString] = image
                }
                return image
            }
        } catch {
            throw ImageError.downloadFailed
        }
        throw ImageError.downloadFailed
    }
    
    static func resizeAndCompressImage(image: UIImage,
                                       targetSize: CGSize = CGSize(width: 512, height: 512),
                                       compressionQuality: CGFloat = 0.8) -> UIImage? {
        // Resize the image
        let resizedImage = resizeImage(image: image, targetSize: targetSize)
        
        // Compress the image and convert back to UIImage
        guard let compressedData = resizedImage.jpegData(compressionQuality: compressionQuality) else {
            return nil
        }
        
        return UIImage(data: compressedData)
    }
    
    private static func resizeImage(image: UIImage,
                                    targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        let rect = CGRect(origin: .zero, size: newSize)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage ?? image
    }
}
