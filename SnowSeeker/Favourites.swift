//
//  Favourites.swift
//  SnowSeeker
//
//  Created by Gokhan Bozkurt on 26.06.2022.
//

import Foundation


class Favourites: ObservableObject {
    private var resorts: Set<String> = [ ]
    private let saveKey = "Favourites"
    
    init() {
        // load our saved data
     
       
         loadData()
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        // write out our data
        if let encoded = try? JSONEncoder().encode(resorts) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    func loadData()  {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) {
               resorts = decoded
            }
        } else {
            resorts = [ ]
        }
 }
}
