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
    
    static let customMissionGreen = Color(hex: "9AEDA5")
    static let customMissionBarGray = Color(hex: "A9A9A9")
    static let customMissionGray = Color(hex: "D7D2D2")
    
    static let customInfoGray = Color(hex: "F5F5F5")
}

