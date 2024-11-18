//
//  ContentView.swift
//  thread_clone
//
//  Created by student on 29/08/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                ThreadsTabView()
            }
            else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
