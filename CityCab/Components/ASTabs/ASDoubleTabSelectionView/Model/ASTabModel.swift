//
//  ASTabModel.swift
//  CityCabHomePageTemplate
//
//  Created by Paul F on 24/2/25.
//

import SwiftUI

/// Model representing a tab item with an identifier, title, image, and selection state.
struct ASTabModel {
    let id: String
    let title: String
    let image: ASImageSource?
    let primaryColor: Color?
    var isSelected: Bool
    
    /// Initializes an `ASTabModel`.
    /// - Parameters:
    ///   - id: Unique identifier for the tab.
    ///   - title: The tab title.
    ///   - image: Optional image source for the tab.
    ///   - primaryColor: Optional primary color for the tab.
    ///   - isSelected: Boolean indicating whether the tab is currently selected.
    init(
        id: String,
        title: String,
        image: ASImageSource? = nil,
        primaryColor: Color? = nil,
        isSelected: Bool = false
    ) {
        self.id = id
        self.title = title
        self.image = image
        self.primaryColor = primaryColor
        self.isSelected = isSelected
    }
    
    /// An empty tab model instance for default usage.
    static let empty = ASTabModel(id: "", title: "", image: nil, isSelected: false)
}

