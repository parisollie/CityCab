//
//  ASImageSource.swift
//  CityCabHomePageTemplate
//
//  Created by Paul F on 24/2/25.
//
import Foundation

//Paso 2.2
enum ASImageSource: Hashable {
    case asset(asset: String)
    case systemName(asset: String)
    case remote(url: URL?)
    
    var assetImage: String? {
        switch self {
            case .asset(asset: let asset):
                return asset
            default:
                return nil
        }
    }
}
