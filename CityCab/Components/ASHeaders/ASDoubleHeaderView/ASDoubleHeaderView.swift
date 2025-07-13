//
//  DoubleHeaderView.swift
//  Uber Ui Clone
//
//  Created by Paul F on 8/2/25.
//

import SwiftUI

///Paso 5.5  A reusable header view with a main title and an optional action text.
struct ASDoubleHeaderView: View {
    private let infoText: String
    private let actionText: String?
    
    var body: some View {
        HStack {
            infoTextView
            Spacer()
            actionTextView
        }
    }
    
    /// Displays the main header text.
    private var infoTextView: some View {
        Text(infoText)
            .font(.h4SemiBold)
            .foregroundColor(.textPrimary)
    }
    
    /// Displays the optional action text.
    @ViewBuilder
    private var actionTextView: some View {
        if let actionText {
            Text(actionText)
                .font(.h6Regular)
                .foregroundColor(.textSecondary)
        }
    }
    
    /// Initializes an `ASDoubleHeaderView`.
    /// - Parameters:
    ///   - themeProvider: The theme provider for styling.
    ///   - infoText: The main title text.
    ///   - actionText: Optional action text (e.g., "See All").
    init(
        infoText: String,
        actionText: String? = nil
    ) {
        self.infoText = infoText
        self.actionText = actionText
    }
}

// MARK: - Preview
#Preview {
    ASDoubleHeaderView(infoText: "Suggestions", actionText: "See All")
}
