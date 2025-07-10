//
//  File.swift
//  ToatUI
//
//  Created by Dor Mizrachi on 12/06/2025.
//

import SwiftUI

public enum ToastActionType: Equatable {
    case loading
    case approve
    case dismiss
    case cancel
    case custom(_ trailingImage: String,_ imagesColor: Color)
    
    var leadingImage: String {
        switch self {
        case .dismiss:
            return "info.circle.fill"
        case .cancel:
            return "exclamationmark.circle"
        case .approve:
            return "checkmark.circle.fill"
        case .loading:
            return "rays"
        case .custom(let imageName, _):
            return imageName
        }
    }
    
    var trailingImage: String {
        switch self {
        case .dismiss:
            return "xmark.circle.fill"
        case .cancel:
            return "xmark.circle.fill"
        case .approve:
            return "wifi"
        case .loading:
            return "rays"
        case .custom(let imageName, _):
            return imageName
        }
    }
    
    var buttonImage: String {
        switch self {
        case .dismiss:
            return "xmark.circle.fill"
        case .cancel:
            return "xmark.circle.fill"
        case .approve:
            return "checkmark.circle.fill"
        case .loading:
            return "rays"
        case .custom(let imageName, _):
            return imageName
        }
    }
    
    func backgroundColor(for colorScheme: ColorScheme) -> Color {
        switch colorScheme {
        case .light:
            // Light mode: white backgrounds with subtle overlays
            switch self {
            case .approve:
                return Color.white
            case .cancel:
                return Color.white
            case .dismiss:
                return Color.white
            case .loading:
                return Color.white
            case .custom(_, _):
                return .white
            }
        case .dark:
            // Dark mode: black backgrounds with subtle overlays
            switch self {
            case .approve:
                return Color.black
            case .cancel:
                return Color.black
            case .dismiss:
                return Color.black
            case .loading:
                return Color.black
            case .custom(_, _):
                return .black
            }
        @unknown default:
            return Color.white
        }
    }
    
    func symbolColor(for colorScheme: ColorScheme) -> Color {
        switch colorScheme {
        case .light:
            // Light mode: gray symbols and text
            switch self {
            case .approve:
                return .black
            case .cancel:
                return .black
            case .dismiss:
                return .black
            case .loading:
                return .black
            case .custom(_, let color):
                return color
            }
        case .dark:
            // Dark mode: same as light but potentially adjusted
            switch self {
            case .approve:
                return .white
            case .cancel:
                return .white
            case .dismiss:
                return .white
            case .loading:
                return .white
            case .custom(_, let color):
                return color
            }
        @unknown default:
            return .gray
        }
    }
    
    func textColor(for colorScheme: ColorScheme) -> Color {
        switch colorScheme {
        case .light:
            // Light mode: gray text
            return Color.gray.opacity(0.9)
        case .dark:
            // Dark mode: light gray text
            return Color.gray.opacity(0.9)
        @unknown default:
            return .gray
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .approve:
            return .green
        case .cancel:
            return .red
        case .dismiss:
            return .blue.opacity(0.8)
        case .loading:
            return .orange.opacity(0.9)
        case .custom(_, let color):
            return color
        }
    }
    
    var symbolColor: Color {
        switch self {
        case .cancel:
            return .white
        case .approve:
            return .white
        case .dismiss:
            return .white
        case .loading:
            return .white
        case .custom:
            return .white
        }
    }
}
