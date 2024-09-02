//
//  CircularProfileImageView.swift
//  thread_clone
//
//  Created by Student on 02/09/24.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image("img1")
            .resizable()
            .scaledToFill()
            .frame(width:40, height:40)
            .clipShape(Circle())
        
    }
}

#Preview {
    CircularProfileImageView()
}
