//
//  ColorData.swift
//  MappingJSONBundle
//
//  Created by User on 24/04/24.
//

import Foundation
import SwiftUI

struct ColorData: Codable, Identifiable {
    var id: Int
    var name: String
    var color: String
    var image: String
    
    ///color from hex
    var uiColor: Color{
        colorFromHexString(color)
    }
    
    // Jika dari API nya brupa String yang tidak kompatibel dengan SF Symbol
    var uiImage: Image{
        Image(systemName: image)
    }
    
}

// MARK: - MOCK DATA
extension ColorData {
    static func loadColorData() -> [ColorData]{
        guard let url = Bundle.main.url(forResource: "Colors", withExtension: "json"), let data = try? Data(contentsOf: url) else{
            fatalError("Failed to load JSON Data from Bundle")
        }
        do{
            let decodedColor = try JSONDecoder().decode([ColorData].self, from: data)
            return decodedColor
        }catch{
            fatalError("Failed to decode JSON Data from bundle: \(error.localizedDescription)")
            
        }
    }
}

