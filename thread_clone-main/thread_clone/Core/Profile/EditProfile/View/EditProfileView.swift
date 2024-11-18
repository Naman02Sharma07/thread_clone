//
//  EditProfileView.swift
//  thread_clone
//
//  Created by student on 30/09/24.
//

import SwiftUI
import PhotosUI
struct EditProfileView: View {
    
    let user:User
    @State private var bio = ""
    @State private var Link = ""
    @State private var isPrivateProfile = false
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = EditProfileViewModel()
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom,.horizontal])
                VStack{
                    
                    HStack{
                        
                        VStack(alignment:.leading){
                            
                            Text("Name")
                                .fontWeight(.semibold)
                            Text(user.fullname)
                            
                        }

                        Spacer()
                        PhotosPicker(selection: $viewModel.selectedItem){
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:40,height:40)
                                    .clipShape(Circle())
                            }else{
                                CircularProfileImageView(user: user, size: .small)
                            }
                        }
                    }
                    Divider()
                    
                    
                    VStack(alignment:.leading){
                        
                        Text("Bio")
                            .fontWeight(.semibold)
                        
                        TextField("Enter Your Bio ....",text:$bio,axis: .vertical)
                    }

                    Divider()
                    
                    VStack(alignment:.leading){
                        Text("Bio")
                            .fontWeight(.semibold)
                        
                        TextField("Add Link...",text:$Link,axis: .vertical)
                    }

                    Divider()
                    Toggle("Private profile",isOn: $isPrivateProfile)
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4),lineWidth: 1)
                }
                .padding()
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading){
                    
                    Button("Cancel"){
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    
                    Button("Done"){
                        Task{
                            try await viewModel.updateUserData()
                            dismiss()
                        }
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                }
            }
        }
    }
}

struct EditProfileView_Previews: PreviewProvider{
    static var previews: some View{
        EditProfileView(user: dev.user)
    }
}
