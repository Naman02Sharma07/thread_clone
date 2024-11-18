//
//  PreviewProvider.swift
//  thread_clone_app
//
//  Created by student on 10/10/24.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Naman Sharma", email: "naman@gmail.com", username: "Nightffury", profileImageUrl: nil, bio: nil)
}
