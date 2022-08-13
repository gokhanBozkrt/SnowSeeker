//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Gokhan Bozkurt on 26.06.2022.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to SnowSeeker!")
                .font(.largeTitle)
            Text("Please select a resort from the left hand menu; swipe left ")
                .foregroundColor(.secondary)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
