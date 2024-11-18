//
//  AuthService.swift
//  thread_clone_app
//
//  Created by student on 04/10/24.
//

import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreCombineSwift

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?//this is the published property that means below as we change this value then this value get update in the usersession
    //this change in property would be refelct on our content view model
    
    
    static let shared = AuthService()
    
    init(){
        self.userSession  = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws{
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
            print("DEBUG: Created user \(result.user.uid)")
        } catch {
            print("DEBUG: failed to create user with error \(error.localizedDescription)")
        }
    }
    
    
    
    @MainActor
    func createUser(withEmail email: String , password: String, fullname: String, username : String) async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password )
            self.userSession = result.user
            try await uploadUserData(withEmail: email, id: result.user.uid , fullname: fullname, username: username)
        } catch {
            print("DEBUG: failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()//this is for the sign out from the backend
        self.userSession = nil//this remove session locally and updates routing
        UserService.shared.reset()//set current user object to null
        
    }
    
    @MainActor
    private func uploadUserData(
        withEmail email: String,
        id: String,
        fullname: String,
        username : String
    )async throws {
        let user = User(id: id, fullname: fullname, email: email, username:username, profileImageUrl: nil)
        guard let userData = try? Firestore.Encoder().encode(user) else {
            return
        }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        
        UserService.shared.currentUser = user
    }
}
