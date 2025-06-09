//
//  ASDoubleTabSelectionView.swift
//  CityCabHomePageTemplate
//
//  Created by Paul F on 24/2/25.
//

import SwiftUI

/// Delegate protocol for `ASDoubleTabSelectionView` to handle tab selection events.
protocol ASDoubleTabSelectionViewDelegate {
    func didSelectTab1(_ tab1Model: ASTabModel)
    func didSelectTab2(_ tab2Model: ASTabModel)
}

/// A view displaying two selectable tabs with smooth toggle animations.
struct ASDoubleTabSelectionView: View {
    @State private var modelTab1: ASTabModel
    @State private var modelTab2: ASTabModel
    private let delegate: ASDoubleTabSelectionViewDelegate?
    
    var body: some View {
        HStack {
            ASTabView(model: modelTab1)
                .onTapGesture { selectTab1() }
            ASTabView(model: modelTab2)
                .onTapGesture { selectTab2() }
        }
        .animation(.smooth, value: modelTab1.isSelected)
        .animation(.smooth, value: modelTab2.isSelected)
    }
    
    /// Handles selection of `modelTab1`, toggling both tabs' states.
    private func selectTab1() {
        guard !modelTab1.isSelected else { return }
        modelTab1.isSelected = true
        modelTab2.isSelected = false
        delegate?.didSelectTab1(modelTab1)
    }
    
    /// Handles selection of `modelTab2`, toggling both tabs' states.
    private func selectTab2() {
        guard !modelTab2.isSelected else { return }
        modelTab2.isSelected = true
        modelTab1.isSelected = false
        delegate?.didSelectTab2(modelTab2)
    }
    
    /// Initializes an `ASDoubleTabSelectionView`.
    /// - Parameters:
    ///   - modelTab1: The first tab model.
    ///   - modelTab2: The second tab model.
    ///   - delegate: An optional delegate to handle tab selection.
    init(
        modelTab1: ASTabModel,
        modelTab2: ASTabModel,
        delegate: ASDoubleTabSelectionViewDelegate? = nil
    ) {
        self._modelTab1 = State(initialValue: modelTab1)
        self._modelTab2 = State(initialValue: modelTab2)
        self.delegate = delegate
    }
}
