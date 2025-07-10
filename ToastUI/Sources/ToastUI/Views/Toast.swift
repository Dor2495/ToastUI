//
//  SwiftUIView.swift
//  ToatUI
//
//  Created by Dor Mizrachi on 12/06/2025.
//
import SwiftUI

@available(iOS 17.0, *)
@MainActor
struct Toast: View {
    
    @Binding private var isPresented: Bool
    private let config: ToastConfig
    @State private var workItem: DispatchWorkItem?
    @Environment(\.colorScheme) private var colorScheme
    
    init(isPresented: Binding<Bool>, config: ToastConfig) {
        self._isPresented = isPresented
        self.config = config
    }
    
    var body: some View {
        if self.isPresented {
            toastContent
                .transition(.asymmetric(
                    insertion: .move(edge: .top).combined(with: .opacity),
                    removal: .move(edge: .top).combined(with: .opacity)
                ))
                .onAppear {
                    scheduleAutoDismiss()
                }
                .onDisappear {
                    workItem?.cancel()
                }
        }
    }
    
    private var toastContent: some View {
        HStack(spacing: 12) {
            // Leading Icon
            if let systemImage = config.systemImage {
                Image(systemName: systemImage)
                    .leadingImageModifier(config.actionType)
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundStyle(config.actionType.symbolColor(for: colorScheme))
                    .frame(width: 24, height: 24)
                    .padding()
            } else {
                Image(systemName: config.actionType.leadingImage)
                    .leadingImageModifier(config.actionType)
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundStyle(config.actionType.symbolColor(for: colorScheme))
                    .frame(width: 24, height: 24)
                    .padding()
            }
            
            // Content
            VStack(alignment: .leading, spacing: 4) {
                Text(config.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(config.actionType.textColor(for: colorScheme))
                    .lineLimit(1)
                
                if let message = config.message {
                    Text(message)
                        .font(.subheadline)
                        .foregroundStyle(config.actionType.textColor(for: colorScheme).opacity(0.8))
                        .lineLimit(2)
                }
            }
            
            Spacer()
            
            // Trailing Action Button
            trailingActionButton
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(
            Capsule()
                .fill(config.actionType.backgroundColor(for: colorScheme))
                .shadow(color: colorScheme == .dark ? .white.opacity(0.3) : .black.opacity(0.1), radius: 8, x: 4, y: 4)
        )
        .padding(.horizontal, 20)
        .offset(y: self.isPresented ? DynamicIslandHelper.bottomOffset : DynamicIslandHelper.hiddenOffset)
    }
    
    @ViewBuilder
    private var trailingActionButton: some View {
        Button(action: handleAction) {
            if config.actionType != .loading {
                Image(systemName: config.actionType.trailingImage)
                    .trailingImageModifier(config.actionType)
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundStyle(config.actionType.symbolColor(for: colorScheme))
                    .frame(width: 24, height: 24)
            }
        }
        .buttonStyle(.plain)
        .opacity(config.actionType == .loading ? 0.7 : 1.0)
    }
    
    private func handleAction() {
        withAnimation(.spring(duration: 0.4, bounce: 0.2)) {
            self.isPresented = false
        }
        config.onAction?()
    }

    private func scheduleAutoDismiss() {
        workItem?.cancel()
        print("scheduleAutoDismiss - ActionType: \(config.actionType)")
        print("Leading Image: \(config.actionType)")
        print("Trailing Image: \(config.actionType)")
        print("Background Color: \(config.actionType)")
        print("Symbol Color: \(config.actionType)")

        let task = DispatchWorkItem {
            withAnimation {
                isPresented = false
            }
        }

        workItem = task
        
        DispatchQueue.main.asyncAfter(deadline: .now() + config.duration, execute: task)
    }
}


// MARK: - Dynamic Island Helper
private struct DynamicIslandHelper {
    static var bottomOffset: CGFloat {
        // Dynamic Island bottom position varies by device
        // iPhone 14 Pro/Pro Max: ~59pt from top
        // This positions the toast just below the Dynamic Island
        return 10
    }
    
    static var hiddenOffset: CGFloat {
        return -50 // Hidden above screen
    }
}
