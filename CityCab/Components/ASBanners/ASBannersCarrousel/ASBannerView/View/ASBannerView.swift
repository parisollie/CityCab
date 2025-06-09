//
//  BannerView.swift
//  Uber Ui Clone
//
//  Created by Paul F on 8/2/25.
//

import SwiftUI

/**
 * ASBannerView
 *
 * A customizable banner component that displays promotional content with a title, call-to-action button,
 * and an image. This component is part of the Alison Studio design system and follows the AS naming convention.
 *
 * Usage:
 * ```
 * // Basic usage with required parameters
 * ASBannerView(model: ASBannerModel(
 *     title: "40% off your next order",
 *     titleColor: .white,
 *     ctaText: "Redeem now",
 *     ctaStyle: .arrow(labelColor: .white),
 *     image: .asset(asset: "promo_image"),
 *     backgroundColor: .blue,
 *     action: { print("Banner tapped") }
 * ))
 *
 * // With custom theme provider
 * let customTheme = ASThemeProviding()
 * ASBannerView(
 *     themeProvider: customTheme,
 *     model: bannerModel
 * )
 * ```
 */
struct ASBannerView: View {
    /// Data model containing all banner configurations
    let model: ASBannerModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: ASSpacing.small) {
                Text(model.title)
                    .font(.h5Bold)
                    .foregroundColor(model.titleColor)
                    .lineLimit(3)
                    
                ASCtaView(text: model.ctaText,
                          textColor: .light,
                          style: model.ctaStyle,
                          action: model.action)
            }
            .frame(width: 170)
            .padding(.leading, ASSpacing.medium)
            .padding(.vertical, ASSpacing.medium)
            
            Spacer()
            
            ASBannerImageView(asImage: model.image)
                .frame(height: model.imageSize)
                .clipShape(RoundedRectangle(cornerRadius: ASRadius.small))
        }
        .background(model.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: ASRadius.medium))
        .overlay(
            Group {
                if model.hasShadows ?? false {
                    RoundedRectangle(cornerRadius: ASRadius.medium)
                        .inset(by: 0.5)
                        .stroke(Color.grey300,
                                lineWidth: 1)
                }
            }
        )
    }
}

/**
 * ASCtaView
 *
 * A call-to-action view that can be displayed as either a button or a text with an arrow.
 * This is a private component used by ASBannerView.
 */
private struct ASCtaView: View {
    // MARK: - Properties
    
    /// The text to display on the CTA
    let asText: String
    
    /// The color of the text
    let asTextColor: Color
    
    /// The style of the CTA (arrow or button)
    let asStyle: ASCtaStyle
    
    /// The action to perform when the CTA is tapped
    let asAction: () -> Void
    
    // MARK: - Initialization
    
    init(text: String,
         textColor: Color,
         style: ASCtaStyle,
         action: @escaping () -> Void) {
        self.asText = text
        self.asTextColor = textColor
        self.asStyle = style
        self.asAction = action
    }
    
    // MARK: - Body
    
    var body: some View {
        Button(action: asAction) {
            switch asStyle {
            case .arrow(let asLabelColor):
                HStack {
                    Text(asText)
                        .font(.smallMedium)
                        .foregroundColor(asLabelColor)
                    Image(systemName: "arrow.right")
                        .foregroundColor(asLabelColor)
                }
            case .button(let asLabelColor, let asButtonColor):
                Text(asText)
                    .font(.smallMedium)
                    .padding(ASSpacing.small)
                    .frame(maxWidth: .infinity)
                    .background(asButtonColor)
                    .foregroundColor(asLabelColor)
                    .clipShape(RoundedRectangle(cornerRadius: ASRadius.extraSmall))
            }
        }
    }
}

/**
 * ASBannerImageView
 *
 * A view that displays an image from different sources (asset or remote URL).
 * This is a private component used by ASBannerView.
 */
private struct ASBannerImageView: View {
    // MARK: - Properties
    
    /// The source of the image
    let asImage: ASImageSource
    
    // MARK: - Body
    
    var body: some View {
        switch asImage {
            case .asset(let asAsset):
                Image(asAsset)
                    .resizable()
                    .scaledToFit()
            case .remote(let asUrl):
                AsyncImage(url: asUrl) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable().scaledToFit()
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color.gray)
                    @unknown default:
                        EmptyView()
                    }
                }
            default:
                EmptyView()
        }
    }
}


// MARK: - Preview
struct ASBannerView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            // Arrow style preview
            ASBannerView(model: ASBannerModel(
                title: "40% off your next 3 restaurant orders.",
                titleColor: .white,
                ctaText: "Redeem now",
                ctaStyle: .arrow(labelColor: .white),
                image: .asset(asset: "food_image"),
                backgroundColor: Color(red: 0.6, green: 0.4, blue: 0.2), // Brown color
                action: {}
            ))
            .frame(height: 150)
            
            // Button style preview
            ASBannerView(model: ASBannerModel(
                title: "New feature available!",
                titleColor: .black,
                ctaText: "Try it now",
                ctaStyle: .button(labelColor: .white, buttonColor: .blue),
                image: .asset(asset: "feature_image"),
                backgroundColor: Color.yellow,
                hasShadows: true,
                action: {}
            ))
            .frame(height: 150)
        }
        .padding()
    }
}
