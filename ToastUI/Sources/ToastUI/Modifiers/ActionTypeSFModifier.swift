//
//  File.swift
//  ToatUI
//
//  Created by Dor Mizrachi on 12/06/2025.
//

import SwiftUI

@available(*, deprecated, message: "Use LeadingImageModifier and TrailingImageModifier instead")

public struct ActionTypeSFModifier: ViewModifier {
    let actionType: ToastActionType
    
    public func body(content: Content) -> some View {
        switch actionType {
        case .loading:
            if #available(iOS 18.0, *) {
                content
                    .symbolEffect(.variableColor.iterative.dimInactiveLayers.nonReversing,
                                  options: .repeat(.continuous))
            } else {
                // Fallback on earlier versions
            }
        default:
            if #available(iOS 17.0, *) {
                content
                    .symbolEffect(.appear)
            } else {
                // Fallback on earlier versions
            }
        }
    }
}
