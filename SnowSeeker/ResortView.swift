//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Gokhan Bozkurt on 26.06.2022.
//

import SwiftUI

struct ResortView: View {
    let resort: Resort
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(\.dynamicTypeSize) var typeSize
    
    @EnvironmentObject var favourites: Favourites
    
    @State private var selectedFacility: Facility?
    @State private var showingFacility = false
 
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ZStack(alignment: .bottomTrailing) {
                    Image(decorative: resort.id)
                            .resizable()
                        .scaledToFit()
                    Text("Credit: \(resort.imageCredit)")
                            .padding(4)
                              .background(.black)
                              .foregroundColor(.white)
                        .offset(x: -5, y: -5)
                }
            
                
                HStack {
                    if sizeClass == .compact && typeSize > .large {
                        VStack(spacing: 10) { ResortDetailsView(resort: resort) }
                        VStack(spacing: 10) {  SkiDetailView(resort: resort) }
                       
                     } else {
                    ResortDetailsView(resort: resort)
                    SkiDetailView(resort: resort)
                    }
                }
                .padding(.vertical)
                .background(Color.primary.opacity(0.1))
                .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
                Group {
                    Text(resort.description)
                        .padding(.vertical)
                    Text("Facilities")
                        .font(.headline)
                    //Text(resort.facilities.joined(separator: ", "))
//                    Text(resort.facilities, format: .list(type: .and))
//                        .padding(.vertical)
                    HStack {
                        ForEach(resort.facilityTypes) { facility in
                            Button {
                                selectedFacility = facility
                                showingFacility = true
                            } label: {
                                facility.icon
                                    .font(.title)
                            }

                        }
                    }
                    Button(favourites.contains(resort) ? "Remove from favourites" : "Add to favourites") {
                        if favourites.contains(resort) {
                            favourites.remove(resort)
                        } else {
                            favourites.add(resort)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("\(resort.name), \(resort.country)")
            .navigationBarTitleDisplayMode(.inline)
            .alert(selectedFacility?.name ?? "More information",isPresented: $showingFacility,presenting: selectedFacility) { _ in
            } message: { facilitiy in
                Text(facilitiy.description)
            }
    }
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ResortView(resort: Resort.exampleData)
        }
        .environmentObject(Favourites())
    }
}
