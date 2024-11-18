//
//  ThreadsTextFieldModifiers.swift
//  thread_clone
//
//  Created by Student on 30/08/24.
//

import SwiftUI

struct ThreadsTextFieldModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal,24)
    }
}
