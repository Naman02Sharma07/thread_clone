//
//  ThreadCell.swift
//  thread_clone
//
//  Created by Student on 02/09/24.
//

import SwiftUI

struct ThreadCell: View {
    var body: some View {
        VStack{
            HStack(alignment: .top,spacing: 12){
                CircularProfileImageView(user: nil, size: .small)
                VStack(alignment: .leading,spacing: 4){
                    HStack{
                        Text("Naman Sharma")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("10m")
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))
                        
                        Button{
                            
                        } label:{
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.systemGray))
                        }
                    }
                    
                    Text("Formula 1 champion")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 16){
                        Button{
                            
                        }label: {
                            Image(systemName: "heart")
                        }
                        
                        
                        Button{
                            
                        }label: {
                            Image(systemName: "bubble.right")
                        }
                        
                        
                        Button{
                            
                        }label: {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        
                        Button{
                            
                        }label: {
                            Image(systemName: "paperplane")
                        }
                    }
                    .foregroundColor(Color(.black))
                    .padding(.vertical,8)
                }
            }
            Divider()
        }
        .padding()
    }
}

#Preview {
    ThreadCell()
}
