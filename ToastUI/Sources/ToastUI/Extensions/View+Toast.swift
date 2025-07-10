//
//  File.swift
//  ToatUI
//
//  Created by Dor Mizrachi on 12/06/2025.
//

import SwiftUI

@available(iOS 17.0, *)
public extension View {
    func toast(
        isPresented: Binding<Bool>,
        config: ToastConfig
    ) -> some View {
        self.modifier(ToastPresenter(isPresented: isPresented, config: config))
    }
    
    func toast(
        isPresented: Binding<Bool>,
        title: String,
        message: String? = nil,
        systemImage: String? = nil,
        actionType: ToastActionType = .dismiss,
        duration: TimeInterval = 3.0,
        onAction: (() -> Void)? = nil
    ) -> some View {
        let config = ToastConfig(
            title: title,
            message: message,
            systemImage: systemImage,
            actionType: actionType,
            duration: duration,
            onAction: onAction
        )
        return self.toast(isPresented: isPresented, config: config)
    }
    
    @ViewBuilder
    func leadingImageModifier(_ actionType: ToastActionType) -> some View {
        self.modifier(LeadingImageModifier(actionType: actionType))
    }
    
    @ViewBuilder
    func trailingImageModifier(_ actionType: ToastActionType) -> some View {
        self.modifier(TrailingImageModifier(actionType: actionType))
    }
    
    @ViewBuilder
    func actionType(_ actionType: ToastActionType) -> some View {
        self.modifier(ActionTypeSFModifier(actionType: actionType))
    }
}
