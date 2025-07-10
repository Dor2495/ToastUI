//
//  SwiftUIView.swift
//  ToatUI
//
//  Created by Dor Mizrachi on 12/06/2025.
//

import SwiftUI

@available(iOS 17.0, *)
struct TestView: View {
    @State var isPresented: Bool = false
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Button("press me") {
                    withAnimation {
                        self.isPresented.toggle()
                    }
                }
            }
        }
        .toast(
            isPresented: $isPresented,
            title: "PLEASE DISMISS ME",
            systemImage: "chart.pie",
            actionType: .custom("brain", .green)
        )
    }
    
    private func dismiss() {
        withAnimation {
            isPresented.toggle()
        }
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        TestView()
    } else {
        // Fallback on earlier versions
    }
}
