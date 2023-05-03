//
//  CharacterModel.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/03.
//

import SwiftUI

struct Character: Identifiable {
    let id = UUID()
    let name: String
    let species: String
    let backColor: Color
    let image: String
}

let haveCharacterCard: [Character] = [Character(name: "뽀", species: "황제팽귄", backColor: Color(hex: "F0D8D8"), image: "penguin"), Character(name: "호", species: "랜서판다", backColor: Color(hex: "CFF2C9"), image: "redPanda")]
