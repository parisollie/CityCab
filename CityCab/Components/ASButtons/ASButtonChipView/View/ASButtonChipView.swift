//
//  ASButtonChipView.swift
//  CityCabHomePageTemplate
//
//  Created by Paul F on 25/2/25.
//

import SwiftUI

/// Protocol defining the delegate methods for button chip interactions
protocol ASButtonChipDelegate {
    /// Called when a button chip is tapped
    /// - Parameter model: The model associated with the tapped button chip
    func tagTapped(with model: ASButtonChipModel)
}

/// A customizable button chip component that can display text with optional icons
/// and supports selected/unselected states
struct ASButtonChipView: View {
    // MARK: - Properties
    /// The model containing the button chip's configuration
    var model: ASButtonChipModel
    
    /// Optional delegate to handle interactions with the button chip
    private var delegate: ASButtonChipDelegate?
    
    // MARK: - View
    
    var body: some View {
        Button {
            if !model.isStatic {
                delegate?.tagTapped(with: model)
            }
        } label: {
            HStack {
                // Left icon (if present)
                if case .left(let systemName) = model.iconSource {
                    Image(systemName: systemName)
                        .foregroundStyle(model.isSelected ? Color.light : Color.textPrimary)
                        .font(model.titleFont ?? .mediumRegular)
                }
                
                // Title text
                Text(model.title)
                    .foregroundStyle(model.isSelected ? Color.light : Color.textPrimary)
                    .font(model.titleFont ?? .mediumRegular)
                
                // Right icon (if present)
                if case .right(let systemName) = model.iconSource {
                    Image(systemName: systemName)
                        .foregroundStyle(model.isSelected ? Color.light : Color.textPrimary)
                        .font(model.titleFont ?? .mediumRegular)
                }
            }
            .padding(ASSpacing.small)
            .padding(.horizontal, ASSpacing.extraSmall)
            .background(model.isSelected ? Color.dark : Color.grey250)
            .clipShape(RoundedRectangle(cornerRadius: ASRadius.extraLarge))
        }
    }
    
    // MARK: - Initialization
    
    /// Creates a new button chip view
    /// - Parameters:
    ///   - model: The configuration model for the button chip
    ///   - delegate: Optional delegate to handle interactions (default: nil)
    init(
        model: ASButtonChipModel,
        delegate: ASButtonChipDelegate? = nil
    ) {
        self.model = model
        self.delegate = delegate
    }
}

struct ASButtonChipView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 16) {
            // Default button chip
            ASButtonChipView(model: ASButtonChipModel(id: "1", title: "Default"))
            
            // Selected button chip
            ASButtonChipView(model: ASButtonChipModel(id: "1",title: "Selected", isSelected: true))
            
            // Button chip with left icon
            ASButtonChipView(model: ASButtonChipModel(
                id: "1",
                title: "Left Icon",
                iconSource: .left(systemName: "star")
            ))
            
            // Button chip with right icon
            ASButtonChipView(model: ASButtonChipModel(
                id: "1",
                title: "Right Icon",
                iconSource: .right(systemName: "chevron.right")
            ))
            
            // Static button chip (non-interactive)
            ASButtonChipView(model: ASButtonChipModel(
                id: "1",
                title: "Static Chip",
                isStatic: true
            ))
        }
        .padding()
    }
}
