//
//  LoginViewModel.swift
//  thread_clone_app
//
//  Created by student on 07/10/24.
//
import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""

    
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
