//
//  RegistrationView.swift
//  thread_clone
//
//  Created by Student on 30/08/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var fullname = ""
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            Spacer()
            
            Image("thread")
                .resizable()
                .scaledToFit()
                .frame(width: 120,height:120)
            
            VStack{
                TextField("Enter your email: ",text:$email)
                    .modifier(ThreadsTextFieldModifiers())

                
                SecureField("Enter your password: ",text: $password)
                    .modifier(ThreadsTextFieldModifiers())

                
                TextField("Enter your fullname: ",text:$fullname)
                    .modifier(ThreadsTextFieldModifiers())

                
                TextField("Enter your username: ",text:$username)
                    .modifier(ThreadsTextFieldModifiers())

            }
            
            Button{
                
            }label: {
                Text("Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 352,height: 44)
                    .background(.black)
                    .cornerRadius(8)
            }
            .padding(.vertical)
            Spacer()
            
            Divider()
            
            Button{
                dismiss()
                
            }label: {
                HStack(spacing: 3){
                    Text("Already have an account?")
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.black)
                .font(.footnote)
            }
            .padding(.vertical,16)
            
        }
    }
}

#Preview {
    RegistrationView()
}
