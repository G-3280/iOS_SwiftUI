//
//  Color+Extension.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/04/30.
//

import SwiftUI

extension Color {
  init(hex: String) {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    
    let r = Double((rgb >> 16) & 0xFF) / 255.0
    let g = Double((rgb >>  8) & 0xFF) / 255.0
    let b = Double((rgb >>  0) & 0xFF) / 255.0
    self.init(red: r, green: g, blue: b)
  }
}


extension Color {
    
    static let customDarkGreen = Color(hex: "38B274")
    static let customGreen = Color(hex: "34E18B")
    static let customAccentGreen = Color(hex: "93FB62")
    static let customGray = Color(hex: "DBD9D9")
    static let customBackGray = Color(hex: "FBFBFD")
    
}

