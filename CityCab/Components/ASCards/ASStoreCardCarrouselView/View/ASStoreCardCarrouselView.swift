//
//  ASStoreCardCarrouselView.swift
//  CityCabHomePageTemplate
//
//  Created by Paul F on 10/3/25.
//
import SwiftUI

/// A horizontal carousel component that displays multiple store cards
/// in a scrollable horizontal layout
struct ASStoreCardCarrouselView: View {
    // MARK: - Properties
    
    /// Array of store models to display in the carousel
    private let models: [ASStoreModel]
    
    /// Optional spacing between cards in the carousel
    private let spacing: CGFloat
    
    /// Optional horizontal padding for the carousel
    private let horizontalPadding: CGFloat
    
    // MARK: - View
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: spacing) {
                ForEach(models, id: \.id) { model in
                    ASStoreCardView(
                        store: model
                    )
                }
            }
        }
    }
    
    // MARK: - Initialization
    
    /// Creates a new store card carousel view
    /// - Parameters:
    ///   - models: Array of store models to display
    ///   - spacing: Spacing between cards (default: medium spacing from theme)
    ///   - horizontalPadding: Horizontal padding for the carousel (default: medium spacing from theme)
    init(
        models: [ASStoreModel],
        spacing: CGFloat? = nil,
        horizontalPadding: CGFloat? = nil
    ) {
        self.models = models
        self.spacing = spacing ?? ASSpacing.medium
        self.horizontalPadding = horizontalPadding ?? ASSpacing.medium
    }
}
