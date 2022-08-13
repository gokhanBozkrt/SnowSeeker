//
//  Groups.swift
//  SnowSeeker
//
//  Created by Gokhan Bozkurt on 25.06.2022.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Text("Hello, World!")
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .font(.title)
        
    }
}

struct Groups: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    var body: some View {
        if sizeClass == .compact {
            VStack(content:UserView.init)
                
            } else {
                HStack(content: UserView.init)
                    
                }
        }
        }
    


struct Groups_Previews: PreviewProvider {
    static var previews: some View {
        Groups()
.previewInterfaceOrientation(.portrait)
    }
}
