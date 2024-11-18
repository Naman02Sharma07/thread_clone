//
//  CurrentUserProfileView.swift
//  thread_clone_app
//
//  Created by student on 11/10/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    @State private var showEditProfile = false;
    
//    @State private var selectedFilter: ProfileThreadFilter = .threads
//    @Namespace var animation
//
//    private var filterBarWidth: CGFloat {
//        let count = CGFloat(ProfileThreadFilter.allCases.count)
//        return UIScreen.main.bounds.width / count - 16
//    }
    
    private var currentuser: User? {
        return viewModel.currentUser
    }
    
    
    
    @StateObject var viewModel = CurrentUserProfileViewModel()
    
    var body: some View {
        
        NavigationStack {
            ScrollView(showsIndicators: false){
                VStack(spacing:20){
                    ProfileHeaderView(user: currentuser)
                    Button{
                        showEditProfile.toggle()
                    }label: {
                        Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .frame(width: 352, height: 32)
                        .background(.white)
                        .cornerRadius(8)
                        .overlay{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(.systemGray4),lineWidth: 1)
                        }
                    }
                    UserContentListView()
                }
            }
            .sheet(isPresented: $showEditProfile, content: {
                if let user = currentuser {
                    EditProfileView(user: user)
                }
//                    .environmentObject(viewModel)
            })
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        AuthService.shared.signOut()
                    }label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                        
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
