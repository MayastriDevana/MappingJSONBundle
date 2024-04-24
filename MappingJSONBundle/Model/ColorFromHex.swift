//
//  ColorFromHex.swift
//  MappingJSONBundle
//
//  Created by User on 24/04/24.
//

import Foundation
import SwiftUI

func colorFromHexString(_ hex: String) -> Color {
    
    /// lakukan proses trimming (membuang spasi di awal dan akhir string)
    /// kemudian hex stringnya dijadikan uppercase
    
    
    let hex = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
    
    /// validasi HEX
    /// asumsi HEX color tanpa alpha(oppasity), maka jumlanya 6 digit
    /// handle HEX jumlahnya menjadi 7 digit, karena termasuk prefix #
    
    guard hex.count == 6 || (hex.count == 7 && hex.hasPrefix("#")) else {
        return Color(red: 0, green: 0, blue: 0) //default color
    }
    
    /// proses konversi HEX
    /// konversi dari string hex yang darin API menjadi Color Swift
    
    let hexColor = hex.hasPrefix("#") ? String(hex.dropFirst()) : hex
    
    ///component color ke dalam susunan RGB (RRGGBB) 273c75
    
    let redColor = hexColor.prefix(2) // 27
    let greenColor = hexColor.dropFirst(2).prefix(2) // drop 2 digit pertama untuk dapetin greencolor = 3c
    let blueColor = hexColor.suffix(2) // 2 digit terakhir
    
    ///1. konversi HEX ke Integer untuk di validasi kembali
    ///2. Radix basis sistem bilangan matematika
    ///3. Dari konsep Radix, kita gunakan konversi String 0-9 dan A-Z menjadi integer
    
    guard let r = UInt64(redColor, radix: 16),
          let g = UInt64(greenColor, radix: 16),
          let b = UInt64(blueColor, radix: 16)
    else{
        return Color(red: 0, green: 0, blue: 0)
    }
    
    let results = Color(red: Double(r), green: Double(g), blue: Double(b) / 255.0)
    return results
    
}
