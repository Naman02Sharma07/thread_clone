//
//  ContentViewModel.swift
//  thread_clone_app
//
//  Created by student on 07/10/24.
//

import Foundation
import Combine
import FirebaseAuth

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setupSubscribers()
    }
    
    private func setupSubscribers(){
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession}.store(in: &cancellables)
    }
}
