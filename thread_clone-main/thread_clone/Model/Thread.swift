//
//  Thread.swift
//  thread_clone_app
//
//  Created by student on 14/11/24.
//

import Firebase
import FirebaseFirestore
struct Thread: Identifiable, Codable{
    @DocumentID var threadId: String?
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    let likes: Int
    
    var id: String {
        return threadId ?? NSUUID().uuidString
    }
    
    
    var user: User?
}
