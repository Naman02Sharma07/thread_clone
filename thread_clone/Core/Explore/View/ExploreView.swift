//
//  ExploreView.swift
//  thread_clone
//
//  Created by Student on 30/08/24.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack{
                    ForEach(0 ... 10, id: \.self){
                        user in
                        UserCell()
                        Divider()
                        .padding(.vertical,4)
                    }
                }
            }
            .navigationTitle("Search")
            .searchable(text: $searchText,prompt: "Search")
        }
    }
    
}

#Preview {
    ExploreView()
}
