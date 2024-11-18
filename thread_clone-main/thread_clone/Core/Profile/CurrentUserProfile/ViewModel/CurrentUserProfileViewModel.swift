//
//  ProfileViewModel.swift
//  thread_clone_app
//
//  Created by student on 09/10/24.
//

import Foundation
import Combine
import PhotosUI
import SwiftUI



class CurrentUserProfileViewModel: ObservableObject {
//    @Published var selectedItem: PhotosPickerItem? {
//        didSet {
//            Task { await loadImage() }
//        }
//    }
//    @Published var profileImage: Image?
    @Published var currentUser: User?
//    private var uiImage: UIImage?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers(){
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
    
//    @MainActor
//    private func loadImage() async {
//        guard let item = selectedItem else {return}
//        
//        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
//        guard let uiImage = UIImage(data: data) else {return}
//        self.uiImage = uiImage
//        self.profileImage = Image(uiImage: uiImage)
//    }
    
}
