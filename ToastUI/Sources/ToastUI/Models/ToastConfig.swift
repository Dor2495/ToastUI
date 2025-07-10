//
//  File.swift
//  ToatUI
//
//  Created by Dor Mizrachi on 12/06/2025.
//

import SwiftUI

public struct ToastConfig {
    public let title: String
    public let message: String?
    public let systemImage: String?
    public let actionType: ToastActionType
    public let duration: TimeInterval
    public let onAction: (() -> Void)?
    
    public init(
        title: String,
        message: String? = nil,
        systemImage: String? = nil,
        actionType: ToastActionType = .dismiss,
        duration: TimeInterval = 3.0,
        onAction: (() -> Void)? = nil
    ) {
        self.title = title
        self.message = message
        self.systemImage = systemImage
        self.actionType = actionType
        self.duration = duration
        self.onAction = onAction
    }
    
    
}
