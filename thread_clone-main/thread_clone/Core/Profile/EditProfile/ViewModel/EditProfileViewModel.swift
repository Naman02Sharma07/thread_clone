//
//  EditProfileViewModel.swift
//  thread_clone_app
//
//  Created by student on 16/10/24.
//

import Foundation
import PhotosUI
import SwiftUI
import Combine

class EditProfileViewModel: ObservableObject{
    @Published var selectedItem: PhotosPickerItem? {
        didSet {
            Task { await loadImage() }
        }
    }
    @Published var profileImage: Image?
    private var uiImage: UIImage?
    private var cancellables = Set<AnyCancellable>()
    
//    func updateUserData() async throws {
//        print("DEBUG: update user Data ")
//    }
    func updateUserData() async throws {
        print("DEBUG: Attempting to update user data")
        do {
            try await updateProfileImage()
            print("DEBUG: Profile image updated successfully")
        } catch {
            print("DEBUG: Error updating profile image: \(error.localizedDescription)")
            throw error
        }
    }

    
    
    
    @MainActor
    private func loadImage() async {
        guard let item = selectedItem else {return}
        
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: data) else {return}
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    
    private func updateProfileImage() async throws {
        guard let image = self.uiImage else {return}
        guard let imageUrl = try? await ImageUploader.uploadImage(image) else {return}
        try await UserService.shared.updateUserProfileImage(withImageUrl: imageUrl)
    }
    
}
