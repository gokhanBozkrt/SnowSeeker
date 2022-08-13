//
//  Bundle - Decodable.swift
//  SnowSeeker
//
//  Created by Gokhan Bozkurt on 25.06.2022.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ file:String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to laod \(file) from bundle")
        }
         let decoder =  JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to deocde \(file) from bundle")
        }
        return loaded
    }
}
