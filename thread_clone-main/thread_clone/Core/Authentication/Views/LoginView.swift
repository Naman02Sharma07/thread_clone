//
//  LoginView.swift
//  thread_clone
//
//  Created by student on 29/08/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()

    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Image("thread")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120,height:120)
                
                VStack{
                    TextField("Enter your email: ",text:$viewModel.email)
                        .autocapitalization(.none)
                        .modifier(ThreadsTextFieldModifiers())
                    
                    SecureField("Enter your password: ",text:$viewModel.password)
                        .modifier(ThreadsTextFieldModifiers())
                }
                
                
                NavigationLink{
                    Text("Forget password")
                }label: {
                    Text("Forget Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing,28)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity,alignment:.trailing)
                }
                
                Button{
                    Task {
                        try await viewModel.login()
                    }
                }label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352,height: 44)
                        .background(.black)
                        .cornerRadius(8)
                }
                
                Spacer()
                
                Divider()
                
                NavigationLink{
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                }label: {
                    HStack(spacing: 3){
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.black)
                    .font(.footnote)
                }
                .padding(.vertical,16)
            }
        }
    }
}

#Preview {
    LoginView()
}
