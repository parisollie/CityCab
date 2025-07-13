//
//  AppFonts.swift
//  Alison Core App
//
//  Created by Paul F on 6/3/25.
//

import SwiftUI

//Paso 1.2
extension Font {
    static let h1Bold: Font = .system(size: ASFontSize.heading1.rawValue, weight: .bold)
    static let h1SemiBold: Font = .system(size: ASFontSize.heading1.rawValue, weight: .semibold)
    static let h1Medium: Font = .system(size: ASFontSize.heading1.rawValue, weight: .medium)
    static let h1Regular: Font = .system(size: ASFontSize.heading1.rawValue, weight: .regular)
    
    static let h2Bold: Font = .system(size: ASFontSize.heading2.rawValue, weight: .bold)
    static let h2SemiBold: Font = .system(size: ASFontSize.heading2.rawValue, weight: .semibold)
    static let h2Medium: Font = .system(size: ASFontSize.heading2.rawValue, weight: .medium)
    static let h2Regular: Font = .system(size: ASFontSize.heading2.rawValue, weight: .regular)
    
    static let h3Bold: Font = .system(size: ASFontSize.heading3.rawValue, weight: .bold)
    static let h3SemiBold: Font = .system(size: ASFontSize.heading3.rawValue, weight: .semibold)
    static let h3Medium: Font = .system(size: ASFontSize.heading3.rawValue, weight: .medium)
    static let h3Regular: Font = .system(size: ASFontSize.heading3.rawValue, weight: .regular)
    
    static let h4Bold: Font = .system(size: ASFontSize.heading4.rawValue, weight: .bold)
    static let h4SemiBold: Font = .system(size: ASFontSize.heading4.rawValue, weight: .semibold)
    static let h4Medium: Font = .system(size: ASFontSize.heading4.rawValue, weight: .medium)
    static let h4Regular: Font = .system(size: ASFontSize.heading4.rawValue, weight: .regular)
    
    static let h5Bold: Font = .system(size: ASFontSize.heading5.rawValue, weight: .bold)
    static let h5SemiBold: Font = .system(size: ASFontSize.heading5.rawValue, weight: .semibold)
    static let h5Medium: Font = .system(size: ASFontSize.heading5.rawValue, weight: .medium)
    static let h5Regular: Font = .system(size: ASFontSize.heading5.rawValue, weight: .regular)
    
    static let h6Bold: Font = .system(size: ASFontSize.heading6.rawValue, weight: .bold)
    static let h6SemiBold: Font = .system(size: ASFontSize.heading6.rawValue, weight: .semibold)
    static let h6Medium: Font = .system(size: ASFontSize.heading6.rawValue, weight: .medium)
    static let h6Regular: Font = .system(size: ASFontSize.heading6.rawValue, weight: .regular)
    
    static let extraLargeBold: Font = .system(size: ASFontSize.heading6.rawValue, weight: .bold)
    static let extraLargeSemiBold: Font = .system(size: ASFontSize.heading6.rawValue, weight: .semibold)
    static let extraLargeMedium: Font = .system(size: ASFontSize.heading6.rawValue, weight: .medium)
    static let extraLargeRegular: Font = .system(size: ASFontSize.heading6.rawValue, weight: .regular)
    
    static let largeBold: Font = .system(size: ASFontSize.large.rawValue, weight: .bold)
    static let largeSemiBold: Font = .system(size: ASFontSize.large.rawValue, weight: .semibold)
    static let largeMedium: Font = .system(size: ASFontSize.large.rawValue, weight: .medium)
    static let largeRegular: Font = .system(size: ASFontSize.large.rawValue, weight: .regular)
    
    static let mediumBold: Font = .system(size: ASFontSize.medium.rawValue, weight: .bold)
    static let mediumSemiBold: Font = .system(size: ASFontSize.medium.rawValue, weight: .semibold)
    static let mediumMedium: Font = .system(size: ASFontSize.medium.rawValue, weight: .medium)
    static let mediumRegular: Font = .system(size: ASFontSize.medium.rawValue, weight: .regular)
    
    static let smallBold: Font = .system(size: ASFontSize.small.rawValue, weight: .bold)
    static let smallSemiBold: Font = .system(size: ASFontSize.small.rawValue, weight: .semibold)
    static let smallMedium: Font = .system(size: ASFontSize.small.rawValue, weight: .medium)
    static let smallRegular: Font = .system(size: ASFontSize.small.rawValue, weight: .regular)
    
    static let extraSmallBold: Font = .system(size: ASFontSize.extraSmall.rawValue, weight: .bold)
    static let extraSmallSemiBold: Font = .system(size: ASFontSize.extraSmall.rawValue, weight: .semibold)
    static let extraSmallMedium: Font = .system(size: ASFontSize.extraSmall.rawValue, weight: .medium)
    static let extraSmallRegular: Font = .system(size: ASFontSize.extraSmall.rawValue, weight: .regular)
}

enum ASFontSize: CGFloat {
    case heading1 = 48
    case heading2 = 40
    case heading3 = 32
    case heading4 = 24
    case heading5 = 20
    case heading6 = 18
    case large = 16
    case medium = 14
    case small = 12
    case extraSmall = 10
}
