//
//  File.swift
//  ToatUI
//
//  Created by Dor Mizrachi on 12/06/2025.
//

import SwiftUI

@available(iOS 17.0, *)
public struct TrailingImageModifier: ViewModifier {
    let actionType: ToastActionType
    
    public func body(content: Content) -> some View {
        switch actionType {
        case .dismiss:
            content
        case .cancel:
            content
        case .approve:
            content
                .symbolEffect(.variableColor.cumulative.hideInactiveLayers.nonReversing,
                            options: .nonRepeating)
        case .loading:
            if #available(iOS 18.0, *) {
                content
                    .symbolEffect(.variableColor.iterative.hideInactiveLayers.nonReversing,
                                  options: .repeat(.continuous))
            } else {
                // Fallback on earlier versions
            }
        case .custom:
            content
                .symbolEffect(.scale.up, options: .speed(0.5))
        }
    }
}
