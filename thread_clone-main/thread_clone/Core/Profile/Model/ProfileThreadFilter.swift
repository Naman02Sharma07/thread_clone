//
//  ProfileThreadFilter.swift
//  thread_clone
//
//  Created by student on 30/09/24.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable,Identifiable{
    case threads
    case replies
    case likes
    
    var title:String{
        switch self{
        case .threads: return "threads"
        case .replies: return "Replies"
        case .likes : return "likes"
        }
    }
    var id: Int{
        return self.rawValue
    }
}
