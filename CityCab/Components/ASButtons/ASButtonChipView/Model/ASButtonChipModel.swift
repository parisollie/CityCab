//
//  ASButtonChipModel.swift
//  CityCabHomePageTemplate
//
//  Created by Paul F on 25/2/25.
//
import SwiftUI

enum IconSourcePosition: Hashable {
    case left(systemName: String), right(systemName: String)
    
    var systemName: String {
        switch self {
        case .left(let name), .right(let name):
            return name
        }
    }
}

struct ASButtonChipModel: Hashable {
    let id: String
    let title: String
    let iconSource: IconSourcePosition?
    var isSelected: Bool
    var isStatic: Bool
    let titleFont: Font?
    
    init(id: String,
         title: String,
         iconSource: IconSourcePosition? = nil,
         isSelected: Bool? = nil,
         isStatic: Bool? = nil,
         titleFont: Font? = nil) {
        self.id = id
        self.title = title
        self.iconSource = iconSource
        self.isSelected = isSelected ?? false
        self.isStatic = isStatic ?? false
        self.titleFont = titleFont
    }
}
