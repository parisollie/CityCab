//
//  ASCategoriesModel.swift
//  CityCabHomePageTemplate
//
//  Created by Paul F on 1/3/25.
//

/// Model representing a category with an identifier, image source, and title.
struct ASCategoryModel: Hashable {
    let id: Int
    let source: ASImageSource
    let title: String
}

