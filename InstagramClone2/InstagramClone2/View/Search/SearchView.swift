//
//  SearchView.swift
//  InstagramClone2
//
//  Created by mac on 14.12.2021.
//

import SwiftUI

struct SearchView: View {
    @State var text = ""
    @State var inSearchMode = false
    var body: some View {
        ScrollView {
            SearchBar(text: $text, isEditing: $inSearchMode)
                .padding()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
