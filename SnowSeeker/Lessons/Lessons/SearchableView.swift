//
//  SearchableView.swift
//  SnowSeeker
//
//  Created by Gokhan Bozkurt on 25.06.2022.
//

import SwiftUI

struct SearchableView: View {
    @State private var searchText = ""
    let allNames = ["Sub","Vine","Coke","Strawberry" ]
    var body: some View {
        NavigationView {
            List(filteredNames, id: \.self) { name in
                Text(name)
            }
           
                .searchable(text: $searchText, prompt: "Look for somethimg")
                .navigationTitle("Searching")
        }
    }
    var filteredNames: [String] {
        if searchText.isEmpty {
            return allNames
        } else {
           return  allNames.filter { $0.localizedCaseInsensitiveContains(searchText)}
        }
    }
    
}

struct SearchableView_Previews: PreviewProvider {
    static var previews: some View {
        SearchableView()
    }
}
