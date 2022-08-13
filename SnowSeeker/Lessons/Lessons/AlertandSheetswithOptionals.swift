//
//  AlertandSheetswithOptionals.swift
//  SnowSeeker
//
//  Created by Gokhan Bozkurt on 25.06.2022.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct AlertandSheetswithOptionals: View {
    @State private var selectedUser: User? = nil
    @State private var  isShowingUser = false
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                selectedUser = User()
                isShowingUser = true
            }.alert("Welcome", isPresented: $isShowingUser, presenting: selectedUser) { user in
                Button(user.id) { }
            }
        
//            .sheet(item: $selectedUser) { user in
//                Text(user.id)
//            }

    }
}

struct AlertandSheetswithOptionals_Previews: PreviewProvider {
    static var previews: some View {
        AlertandSheetswithOptionals()
    }
}
