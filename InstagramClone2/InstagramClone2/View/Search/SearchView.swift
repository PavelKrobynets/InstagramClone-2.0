//
//  SearchView.swift
//  InstagramClone2
//
//  Created by mac on 14.12.2021.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel = SearchViewModel()
    @State var text = ""
    @State var inSearchMode = false
    var body: some View {
        ScrollView {
            SearchBar(text: $text, isEditing: $inSearchMode)
                .padding()
            
            ZStack{
                if inSearchMode {
                    UserListView(viewModel: viewModel, searchText: $text)
                }
                else{
                    PostGridView(filter: .search)
                    
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
