//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Gokhan Bozkurt on 25.06.2022.
//

import SwiftUI

//extension View {
//    @ViewBuilder func phoneOnlyNavigationView() -> some View {
//        if UIDevice.current.userInterfaceIdiom == .phone {
//            self.navigationViewStyle(.stack)
//        } else {
//            self
//        }
//    }
//}


struct ContentView: View {
    let resorts = (Bundle.main.decode("resorts.json") as [Resort])
    @State private var searchText = ""
    @StateObject var favourites = Favourites()
    @State private var showSortConfirmation = false
    @State private var sortOrder = SortType.defaultOrder
    enum SortType {
        case country,name, defaultOrder
    }
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.green
                        .opacity(0.5)
                        .ignoresSafeArea()
                List(filteredResorts) { resort in
                    NavigationLink {
                       ResortView(resort: resort)
                    } label: {
                        HStack {
                            Image(resort.country)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 25)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black,lineWidth: 1)
                                )
                            VStack(alignment: .leading) {
                                Text(resort.name)
                                    .font(.headline)
                                Text("\(resort.runs) runs")
                                    .foregroundColor(.secondary)
                            }
                            if favourites.contains(resort) {
                                Spacer()
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.red)
                                    .accessibilityLabel("This is a favoute resort")
                            }
                        }
                    }
        
                }
                
                
                .onAppear{
                    searchTextModify()
                }
                .listStyle(.plain)
                    .searchable(text: $searchText,prompt: "Search for a resort")
                .navigationTitle("Resorts")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                           showSortConfirmation = true
                        } label: {
                            Label("Sort", systemImage: "arrow.up.arrow.down.circle")
                        }
                        }
                }
                .confirmationDialog("Sort by...", isPresented: $showSortConfirmation) {
                    Button("Name(A-Z)") { sortOrder = .name  }
                    Button("By Country") { sortOrder = .country }
                    Button("Cancel",role: .cancel) { }
                } message: {
                    Text("Sort by something")
                }
               
                 
            }
            WelcomeView()
        }
        .environmentObject(favourites)
      //  .phoneOnlyNavigationView()
    
    }
    
    var filteredResorts: [Resort] {
        let result: [Resort]
       
        if searchText.isEmpty {
           result = resorts
        } else {
            result = resorts.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
        if sortOrder == .name {
            return  result.sorted { $0.name < $1.name }
        } else  if sortOrder == .country  {
            return result.sorted { $0.country < $1.country}
        } else {
            return result
        }
    }
    
    
    func searchTextModify() {
        searchText = ""
    }
    
    
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}


