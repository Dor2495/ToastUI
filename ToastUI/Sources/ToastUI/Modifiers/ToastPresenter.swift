//
//  File.swift
//  ToatUI
//
//  Created by Dor Mizrachi on 12/06/2025.
//

import SwiftUI

@available(iOS 17.0, *)
public struct ToastPresenter: ViewModifier {
    @Binding var isPresented: Bool
    let config: ToastConfig
    
    public func body(content: Content) -> some View {
        content
            .overlay(alignment: .top) {
                Toast(isPresented: $isPresented, config: config)
            }
    }
}
