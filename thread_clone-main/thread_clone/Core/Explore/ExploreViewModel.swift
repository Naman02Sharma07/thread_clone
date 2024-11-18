//
//  ExploreViewModel.swift
//  thread_clone_app
//
//  Created by student on 10/10/24.
//

import Foundation

class ExploreViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init() {
        Task { try await fetchUsers() }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
