//
//  ConditionalsModifiers.swift
//  Uber Ui Clone
//
//  Created by Paul F on 5/2/25.
//

import SwiftUI

extension View {
    public func hidden(_ shouldHide: Bool) -> some View {
        self.opacity(shouldHide ? 0 : 1)
    }

    public func border(_ color: Color, width: CGFloat, cornerRadius: CGFloat) -> some View {
        self.overlay(RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(color, lineWidth: width))
    }

    @ViewBuilder
    public func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }

    @ViewBuilder
    public func `ifelse`<Content: View>(_ condition: Bool, ifTransform: (Self) -> Content, elseTransform: (Self) -> Content) -> some View {
        if condition {
            ifTransform(self)
        } else {
            elseTransform(self)
        }
    }

    @ViewBuilder
    public func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
