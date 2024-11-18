//
//  CircularProfileImageView.swift
//  thread_clone
//
//  Created by Student on 02/09/24.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xlarge
    
    var dimention: CGFloat {
        switch self {
        case .xlarge: return 80
        case .large: return 64
        case .medium: return 48
        case .small: return 40
        case .xSmall: return 32
        case .xxSmall: return 28
        }
    }
}



struct CircularProfileImageView: View {
    
    var user: User?
    
    let size: ProfileImageSize
    
    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width:size.dimention, height:size.dimention)
                .clipShape(Circle())
        }else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .foregroundColor(Color(.systemGray4))
                .frame(width:size.dimention, height:size.dimention)
        }
    }
}

struct CircularProfileImageView_Previews: PreviewProvider{
    static var previews: some View {
        CircularProfileImageView(user: dev.user, size: .medium)
    }
}
