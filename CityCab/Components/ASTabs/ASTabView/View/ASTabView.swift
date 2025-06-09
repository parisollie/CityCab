//
//  ASTabView.swift
//  CityCabHomePageTemplate
//
//  Created by Paul F on 24/2/25.
//

import SwiftUI

/// Constants used within `ASTabView`.
private enum ASTabViewConstants {
    enum Sizes {
        static let cornerRadius: CGFloat = 100
        static let minHeight: CGFloat = 4
        static let spacing: CGFloat = 12
        static let imageSize: CGFloat = 44
    }
}

/// A tab view representing an individual selectable tab with an optional image and title.
struct ASTabView: View {
    let model: ASTabModel
    
    var body: some View {
        VStack(spacing: ASTabViewConstants.Sizes.spacing) {
            tabContent
            selectionIndicator
        }
    }
    
    /// The main content of the tab, including an optional image and the tab title.
    private var tabContent: some View {
        HStack {
            if let source = model.image {
                ASAsyncImageView(source: source)
                    .frame(width: ASTabViewConstants.Sizes.imageSize, height: ASTabViewConstants.Sizes.imageSize)
            }
            
            Text(model.title)
                .font(.largeSemiBold)
                .foregroundStyle(textColor)
        }
    }
    
    /// The selection indicator shown at the bottom of the tab.
    private var selectionIndicator: some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(maxWidth: .infinity,
                   minHeight: ASTabViewConstants.Sizes.minHeight,
                   maxHeight: ASTabViewConstants.Sizes.minHeight)
            .background(model.isSelected ? primaryColor : .grey200)
            .cornerRadius(ASTabViewConstants.Sizes.cornerRadius)
    }
    
    /// The primary color of the tab, falling back to the theme’s primary color.
    private var primaryColor: Color {
        model.primaryColor ?? Color.primary
    }
    
    /// Determines the text color based on selection and theme mode.
    private var textColor: Color {
        model.isSelected ? primaryColor : .grey500
    }
}

