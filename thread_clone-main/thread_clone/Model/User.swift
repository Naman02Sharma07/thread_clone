//
//  User.swift
//  thread_clone_app
//
//  Created by student on 07/10/24.
//

import Foundation

struct User: Identifiable, Codable, Hashable{
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
