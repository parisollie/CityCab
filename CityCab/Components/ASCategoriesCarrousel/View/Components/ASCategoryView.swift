//
//  ASCategoryView.swift
//  CityCabHomePageTemplate
//
//  Created by Paul F on 1/3/25.
//

import SwiftUI

///Paso 9.3 Constants used within `ASCategoryView`.
private enum ASCategoryViewConstants {
    enum Sizes {
        static let imageSize: CGFloat = 54
    }
}

/// A view representing a single category with an icon and a title.
struct ASCategoryView: View {
    private let category: ASCategoryModel
    
    var body: some View {
        VStack(spacing: ASSpacing.extraSmall) {
            categoryImage
            categoryTitle
        }
        .padding(ASSpacing.small)
    }
    
    /// Displays the category image.
    private var categoryImage: some View {
        Image(category.source.assetImage ?? "")
            .resizable()
            .scaledToFit()
            .frame(width: ASCategoryViewConstants.Sizes.imageSize,
                   height: ASCategoryViewConstants.Sizes.imageSize)
            .clipShape(RoundedRectangle(cornerRadius: ASRadius.small))
    }
    
    /// Displays the category title.
    private var categoryTitle: some View {
        Text(category.title)
            .font(.mediumRegular)
            .foregroundColor(.textPrimary)
            .multilineTextAlignment(.center)
    }
    
    /// Initializes an `ASCategoryView`.
    /// - Parameters:
    ///   - themeProvider: The theme provider for consistent styling.
    ///   - category: The category model containing image and title.
    init(category: ASCategoryModel) {
        self.category = category
    }
}


#Preview {
    ASCategoryView(category: ASCategoryModel(id: 1,
                                             source: .asset(asset: "grocery"),
                                             title: "Grocery"))
}
