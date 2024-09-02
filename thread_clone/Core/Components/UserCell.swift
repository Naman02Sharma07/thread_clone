//
//  UserCell.swift
//  thread_clone
//
//  Created by Student on 02/09/24.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        VStack {
            HStack{
                CircularProfileImageView()
                
                VStack(alignment: .leading){
                    Text("shivani jha")
                        .fontWeight(.semibold)
                    
                    Text("Shivani")
                }
                .font(.footnote)
                
                Spacer()
                
                Text("Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 100, height: 32)
                    .overlay{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.systemGray4),lineWidth: 1)
                    }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    UserCell()
}
