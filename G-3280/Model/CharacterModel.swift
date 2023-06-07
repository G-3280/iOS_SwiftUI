//
//  CharacterModel.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/03.
//

import SwiftUI

enum Character {
    case emperorPenguin
    case redPanda
    case redFox
    case polarBear
    case turtle
    case marten
    
    init?(imageName: String) {
        switch imageName {
        case "emperorPenguin":
            self = .emperorPenguin
        case "redPanda":
            self = .redPanda
        case "redFox":
            self = .redFox
        case "polarBear":
            self = .polarBear
        case "turtle":
            self = .turtle
        case "marten":
            self = .marten
        default:
            return nil
        }
    }
    
    var name: String {
        switch self {
        case .emperorPenguin:
            return "뽀"
        case .redPanda:
            return "호"
        case .redFox:
            return "호"
        case .polarBear:
            return "고미"
        case .turtle:
            return "부기"
        case .marten:
            return "다미"
        }
    }
    
    var species: String {
        switch self {
        case .emperorPenguin:
            return "황제팽귄"
        case .redPanda:
            return "랜서판다"
        case .redFox:
            return "붉은여우"
        case .polarBear:
            return "북극곰"
        case .turtle:
            return "바다거북"
        case .marten:
            return "아기담비"
        }
    }
    
    var backColor: Color {
        switch self {
        case .emperorPenguin:
            return Color(hex: "F0D8D8")
        case .redPanda:
            return Color(hex: "CFF2C9")
        case .redFox:
            return Color(hex: "F2E9C9")
        case .polarBear:
            return Color(hex: "F2C9C9")
        case .turtle:
            return Color(hex: "C9E8F2")
        case .marten:
            return Color(hex: "DBC9F2")
        }
    }
    
    var image: String {
        switch self {
        case .emperorPenguin:
            return "emperorPenguin"
        case .redPanda:
            return "redPanda"
        case .redFox:
            return "redFox"
        case .polarBear:
            return "polarBear"
        case .turtle:
            return "turtle"
        case .marten:
            return "marten"
        }
    }
}
