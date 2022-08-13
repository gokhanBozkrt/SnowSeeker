//
//  ViewsSideBySide.swift
//  SnowSeeker
//
//  Created by Gokhan Bozkurt on 25.06.2022.
//

import SwiftUI

struct ViewsSideBySide: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                Text("New Secondary")
            } label: {
                Text("Hello, World!")

            }
                .navigationTitle("Primary")
            Text("Secondary")
            Text("Tertiary")
        }
    }
}

struct ViewsSideBySide_Previews: PreviewProvider {
    static var previews: some View {
        ViewsSideBySide()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
