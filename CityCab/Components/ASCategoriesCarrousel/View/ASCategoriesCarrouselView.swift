//
//  ASCategoriesCarrouselView.swift
//  CityCabHomePageTemplate
//
//  Created by Paul F on 1/3/25.
//

import SwiftUI
import Observation

/// A horizontal scrolling carousel displaying a list of categories.
struct ASCategoriesCarouselView: View {
    let categories: [ASCategoryModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: ASSpacing.small) {
                ForEach(categories, id: \.self) { category in
                    ASCategoryView(category: category)
                }
            }
        }
    }
}

