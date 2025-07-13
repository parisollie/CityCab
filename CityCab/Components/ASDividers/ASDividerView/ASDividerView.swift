//
//  DividerOrientation.swift
//  Uber Ui Clone
//
//  Created by Paul F on 6/2/25.
//
import SwiftUI

//paso 4.4
/// Defines the possible orientations for `ASDividerView`.
enum ASDividerOrientation {
    case horizontal
    case vertical
}

/// A customizable divider supporting both horizontal and vertical orientations.
struct ASDividerView: View {
    private let color: Color
    private let orientation: ASDividerOrientation
    
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(
                width: orientation == .vertical ? 0.5 : nil,
                height: orientation == .horizontal ? 0.5 : nil
            )
            .edgesIgnoringSafeArea(orientation == .horizontal ? .horizontal : .vertical)
    }
    
    /// Initializes an `ASDividerView`.
    /// - Parameters:
    ///   - color: The color of the divider.
    ///   - orientation: The divider orientation (`horizontal` or `vertical`).
    init(
        color: Color? = nil,
        orientation: ASDividerOrientation = .horizontal
    ) {
        self.color = color ?? .grey300
        self.orientation = orientation
    }
}

