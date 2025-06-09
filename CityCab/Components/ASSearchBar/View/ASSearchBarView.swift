//
//  ASSearchBarView.swift
//  CityCabHomePageTemplate
//
//  Created by Paul F on 1/3/25.
//

import SwiftUI

/// Delegate protocol for `ASSearchBarView` to handle search-related events.
protocol ASSearchBarDelegate {
    func closeIconTapped(_ text: String)
    func userWriting(_ text: String)
    func userSubmit(_ text: String)
}

/// A customizable search bar supporting optional text area mode, numeric input, and character limits.
struct ASSearchBarView: View {
    @FocusState private var isFocused: Bool
    @Binding var textFieldTextResult: String
    @Binding var isTextFieldFocused: Bool
    
    private let mustShowsLeftIcon: Bool
    private let mustAlwaysHaveFocus: Bool
    private let isTextArea: Bool
    private let isNumeric: Bool
    private let isDisabled: Bool
    private let characterLimit: Int?
    private let maxHeight: CGFloat?
    private let placeholder: String
    private let delegate: ASSearchBarDelegate?
    
    var body: some View {
        VStack(alignment: .leading, spacing: ASSpacing.extraSmall) {
            searchField
            characterLimitView
        }
    }
    
    /// Search field containing a text field or a text area.
    private var searchField: some View {
        HStack(spacing: ASSpacing.small) {
            leftIcon
            textField
            clearButton
        }
        .padding(.vertical, ASSpacing.medium)
        .padding(.horizontal, ASSpacing.large)
        .frame(maxWidth: .infinity, minHeight: isTextArea ? 58 : 56, maxHeight: isTextArea ? maxHeight ?? 200 : 56)
        .background(textfieldBackground)
        .cornerRadius(ASRadius.medium)
        .overlay(
            RoundedRectangle(cornerRadius: ASRadius.medium)
                .stroke(.clear, lineWidth: 1)
        )
        .onChange(of: isFocused) { isTextFieldFocused = isFocused }
        .onChange(of: isTextFieldFocused) { isFocused = isTextFieldFocused }
        .onChange(of: textFieldTextResult) { delegate?.userWriting(textFieldTextResult) }
    }
    
    /// Left icon (magnifying glass) if enabled.
    @ViewBuilder
    private var leftIcon: some View {
        if mustShowsLeftIcon {
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(textfieldColor)
                .onTapGesture {
                    if !textFieldTextResult.isEmpty {
                        delegate?.userSubmit(textFieldTextResult)
                    }
                }
        }
    }
    
    /// The text input area, which can be a `TextField` or `TextEditor` depending on configuration.
    private var textField: some View {
        Group {
            if isTextArea {
                TextEditor(text: $textFieldTextResult)
                    .onChange(of: textFieldTextResult) { enforceCharacterLimit() }
                    .textEditorStyle(PlainTextEditorStyle())
                    #if os(iOS)
                    .keyboardType(isNumeric ? .decimalPad : .default)
                    #endif
                    .font(inputFont)
                    .frame(minHeight: maxHeight ?? 46, maxHeight: maxHeight ?? 200)
                    .foregroundStyle(textfieldColor)
                    .focused($isFocused)
                    .disabled(isDisabled)
                    .padding(.top, ASSpacing.small)
            } else {
                TextField(placeholder, text: $textFieldTextResult)
                    .textFieldStyle(PlainTextFieldStyle())
                    #if os(iOS)
                    .keyboardType(isNumeric ? .decimalPad : .default)
                    #endif
                    .font(inputFont)
                    .foregroundStyle(textfieldColor)
                    .focused($isFocused)
                    .disabled(isDisabled)
            }
        }
    }
    
    /// Clear button that resets the text field when tapped.
    @ViewBuilder
    private var clearButton: some View {
        if !textFieldTextResult.isEmpty {
            Image(systemName: "xmark")
                .frame(width: 12, height: 12)
                .foregroundStyle(Color.textPrimary)
                .onTapGesture {
                    delegate?.closeIconTapped(textFieldTextResult)
                    textFieldTextResult = ""
                }
        }
    }
    
    /// Character limit display when the field is a text area.
    @ViewBuilder
    private var characterLimitView: some View {
        if let limit = characterLimit, isTextArea {
            HStack {
                Spacer()
                Text("\(textFieldTextResult.count)/\(limit)")
                    .font(.extraSmallRegular)
                    .foregroundColor(textFieldTextResult.count > limit ? .error : .textPrimary)
                    .padding(.trailing, ASSpacing.small)
            }
        }
    }
    
    /// Enforces the character limit if set.
    private func enforceCharacterLimit() {
        if let limit = characterLimit, textFieldTextResult.count > limit {
            textFieldTextResult = String(textFieldTextResult.prefix(limit))
        }
    }
    
    /// Determines the font style based on focus state.
    private var inputFont: Font {
        isFocused || mustAlwaysHaveFocus ? .largeSemiBold : .largeRegular
    }
    
    /// Background color of the text field.
    private var textfieldBackground: Color {
        .grey300
    }
    
    /// Text color of the text field.
    private var textfieldColor: Color {
        .dark
    }
    
    /// Initializes an `ASSearchBarView`.
    /// - Parameters:
    ///   - placeholder: Placeholder text for the search bar.
    ///   - textFieldTextResult: The text binding for input.
    ///   - isTextFieldFocused: The binding to track focus state.
    ///   - mustShowsLeftIcon: Whether to show a magnifying glass icon.
    ///   - mustAlwaysHaveFocus: Whether the field should always be focused.
    ///   - isTextArea: Whether the field should be a text area.
    ///   - isNumeric: Whether the input should be numeric.
    ///   - isDisabled: Whether the input field is disabled.
    ///   - characterLimit: The maximum allowed character count.
    ///   - maxHeight: The maximum height of the field (if a text area).
    ///   - delegate: A delegate to handle interactions.
    init(
        placeholder: String,
        textFieldTextResult: Binding<String>,
        isTextFieldFocused: Binding<Bool>,
        mustShowsLeftIcon: Bool? = nil,
        mustAlwaysHaveFocus: Bool? = nil,
        isTextArea: Bool = false,
        isNumeric: Bool = false,
        isDisabled: Bool = false,
        characterLimit: Int? = nil,
        maxHeight: CGFloat? = nil,
        delegate: ASSearchBarDelegate? = nil
    ) {
        self.placeholder = placeholder
        self._textFieldTextResult = textFieldTextResult
        self._isTextFieldFocused = isTextFieldFocused
        self.mustShowsLeftIcon = mustShowsLeftIcon ?? true
        self.mustAlwaysHaveFocus = mustAlwaysHaveFocus ?? false
        self.isTextArea = isTextArea
        self.isNumeric = isNumeric
        self.isDisabled = isDisabled
        self.characterLimit = characterLimit
        self.maxHeight = maxHeight
        self.delegate = delegate
    }
}
