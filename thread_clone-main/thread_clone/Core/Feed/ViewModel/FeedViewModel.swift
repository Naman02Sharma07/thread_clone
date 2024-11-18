//
//  FeedViewModel.swift
//  thread_clone_app
//
//  Created by student on 14/11/24.
//

import Foundation

class FeedViewModel {
    @Published var threads = [Thread]()
    
    init() {
        Task {
            try await fetchThreads()
        }
    }
    
    func fetchThreads() async throws{
        self.threads = try await ThreadService.fetchThreads()
    }
}
