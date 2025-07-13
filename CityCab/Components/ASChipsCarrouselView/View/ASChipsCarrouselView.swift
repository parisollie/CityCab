//
//  ASChipsCarrouselView.swift
//  CityCabHomePageTemplate
//
//  Created by Paul F on 10/3/25.
//

import SwiftUI

///Paso 10.2  Delegate protocol for `ASChipsCarrouselView` to handle chip selection.
protocol ASChipsCarouselViewDelegate {
    func tagSelected(with model: ASButtonChipModel, and index: Int)
}

/// A horizontal scrollable list of chips, allowing selection and delegation of events.
struct ASChipsCarouselView: View {
    private var delegate: ASChipsCarouselViewDelegate?
    
    @State private var models: [ASButtonChipModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: ASSpacing.small) {
                ForEach(models.indices, id: \.self) { index in
                    ASButtonChipView(model: models[index], delegate: self)
                        .id(models[index].id + (models[index].isSelected ? "-selected" : ""))
                }
            }
        }
    }
    
    /// Initializes `ASChipsCarouselView`
    /// - Parameters:
    ///   - models: The list of chip models to display.
    ///   - delegate: The delegate handling selection interactions.
    init(
        models: [ASButtonChipModel],
        delegate: ASChipsCarouselViewDelegate? = nil
    ) {
        self._models = State(initialValue: models)
        self.delegate = delegate
    }
}

// MARK: - ASButtonChipDelegate
extension ASChipsCarouselView: ASButtonChipDelegate {
    /// Handles chip selection logic.
    /// - Parameter model: The selected chip model.
    func tagTapped(with model: ASButtonChipModel) {
        models.indices.forEach { index in
            if !models[index].isStatic {
                models[index].isSelected = models[index].id == model.id
            }
        }
        
        if let selectedIndex = models.firstIndex(where: { $0.id == model.id }) {
            delegate?.tagSelected(with: models[selectedIndex], and: selectedIndex)
        }
    }
}

