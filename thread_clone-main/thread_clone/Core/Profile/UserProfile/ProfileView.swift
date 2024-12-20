//
//  ProfileView.swift
//  thread_clone
//
//  Created by Student on 02/09/24.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(spacing:20){
                ProfileHeaderView(user: user)
                Button{
                    
                }label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .cornerRadius(8)
                }
                UserContentListView()
            }
        }
//        .toolbar{
//            ToolbarItem(placement: .navigationBarTrailing){
//                Button{
//                    AuthService.shared.signOut()
//                }label: {
//                    Image(systemName: "line.3.horizontal")
//                        .foregroundColor(.black)
//                    
//                }
//            }
//        }
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: dev.user)
    }
}
