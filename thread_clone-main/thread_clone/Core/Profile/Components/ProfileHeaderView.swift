//
//  ProfileHeaderView.swift
//  thread_clone_app
//
//  Created by student on 11/10/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    var user: User?
    
    init(user: User?) {
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .top){
            VStack(alignment: .leading, spacing: 12){
                VStack(alignment: .leading,spacing:4){
                    Text(user?.fullname ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(user?.username ?? "")
                        .font(.subheadline)
                }
                
                if let bio = user?.bio{
                    Text(bio)
                        .font(.footnote)
                }
                
                Text("2 follower")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            CircularProfileImageView(user: user, size: .medium)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: dev.user)
    }
}
