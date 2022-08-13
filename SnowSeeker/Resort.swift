//
//  Resort.swift
//  SnowSeeker
//
//  Created by Gokhan Bozkurt on 25.06.2022.
//

import Foundation

struct Resort: Identifiable,Codable {
    let id: String
    let name: String
    let country: String
    let description: String
    let imageCredit: String
    let price: Int
    let size: Int
    let snowDepth: Int
    let elevation: Int
    let runs: Int
    let facilities: [String]
    
    var facilityTypes: [Facility] {
        facilities.map(Facility.init)
    }
   // Instead of below you can do this
    static let exampleData = (Bundle.main.decode("resorts.josn") as [Resort])[0]
    
 //   static let allResorts: [Resort] = Bundle.main.decode("resorts.josn")
  //  static let example = allResorts[0]
    
}
