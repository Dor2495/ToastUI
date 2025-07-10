//
//  File.swift
//  ToatUI
//
//  Created by Dor Mizrachi on 12/06/2025.
//

import SwiftUI

@available(iOS 17.0, *)
public struct LeadingImageModifier: ViewModifier {
    let actionType: ToastActionType
    
    public func body(content: Content) -> some View {
        switch actionType {
        case .dismiss:
            content
                .symbolEffect(.scale.byLayer, options: .speed(0.8))
        case .cancel:
            if #available(iOS 18.0, *) {
                content
                    .symbolEffect(.bounce.up.byLayer, options: .speed(1.0))
            } else {
                // Fallback on earlier versions
            }
        case .approve:
            content
        case .loading:
            if #available(iOS 18.0, *) {
                content
                    .symbolEffect(.variableColor.iterative.dimInactiveLayers.nonReversing,
                                  options: .repeat(.continuous).speed(1.5))
            } else {
                // Fallback on earlier versions
            }
        case .custom:
            content
                .symbolEffect(.scale.up, options: .speed(0.6))
        }
    }
}
