//
//  ASBackgroundBlurView.swift
//  ASSocialHome1
//
//  Created by Paul F on 22/2/25.
//

import SwiftUI

/**
 * ASBackgroundBlurView
 *
 * A customizable background view that provides a semi-transparent colored backdrop.
 * This component is part of the Alison Studio design system and follows the AS naming convention.
 *
 * Usage:
 * ```
 * // Basic usage with default opacity
 * ASBackgroundBlurView()
 *
 * // Custom opacity
 * ASBackgroundBlurView(opacity: 0.8)
 *
 * // With custom theme provider
 * let customTheme = ASThemeProviding()
 * ASBackgroundBlurView(themeProvider: customTheme)
 * ```
 */
struct ASBackgroundBlurView: View {
    // MARK: - Properties
    
    /// Opacity level of the background color (0.0 - 1.0)
    let asOpacity: Double
    
    // MARK: - Initialization
    
    /**
     * Initializes a new background blur view
     *
     * - Parameters:
     *   - opacity: The opacity level of the background (0.0 - 1.0). Defaults to 0.6 if nil.
     *   - themeProvider: The theme provider to use for color values. Defaults to ASThemeProviding().
     */
    init(opacity: Double? = nil) {
        self.asOpacity = opacity ?? 0.6
    }
    
    // MARK: - Body
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .background(
                Color.dark.opacity(asOpacity)
            )
    }
}

// MARK: - Preview

struct ASBackgroundBlurView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Content behind blur")
                .padding()
            
            ASBackgroundBlurView()
                .frame(width: 200, height: 100)
            
            ASBackgroundBlurView(opacity: 0.8)
                .frame(width: 200, height: 100)
        }
    }
}

