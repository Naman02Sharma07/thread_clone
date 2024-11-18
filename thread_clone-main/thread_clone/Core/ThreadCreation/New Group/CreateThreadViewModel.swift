//
//  CreateThreadViewModel.swift
//  thread_clone_app
//
//  Created by student on 14/11/24.
//

import Foundation
import FirebaseAuth
import FirebaseCore
class CreateThreadViewModel: ObservableObject {
    
    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let thread = Thread(ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(thread)
    }
}


