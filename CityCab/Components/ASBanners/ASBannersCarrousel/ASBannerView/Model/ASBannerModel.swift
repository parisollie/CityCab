//
//  BannerModel.swift
//  Uber Ui Clone
//
//  Created by Paul F on 8/2/25.
//

import SwiftUI

enum ASCtaStyle {
    case arrow(labelColor: Color)
    case button(labelColor: Color, buttonColor: Color)
}

struct ASBannerModel: Hashable {
    var title: String
    var titleColor: Color
    var ctaText: String
    var ctaStyle: ASCtaStyle
    var image: ASImageSource
    var imageSize: CGFloat? = 150
    var backgroundColor: Color
    var hasShadows: Bool? = false
    var action: () -> Void
    
    static func == (lhs: ASBannerModel, rhs: ASBannerModel) -> Bool {
        lhs.title == rhs.title &&
        lhs.titleColor == rhs.titleColor &&
        lhs.ctaText == rhs.ctaText &&
        lhs.backgroundColor == rhs.backgroundColor
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(titleColor)
        hasher.combine(ctaText)
        hasher.combine(backgroundColor)
    }
}
