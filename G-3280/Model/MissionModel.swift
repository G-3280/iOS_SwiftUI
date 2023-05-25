//
//  MissionModel.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/12.
//

import Foundation

enum missionCategory: String, CaseIterable {
    case today = "today"
    case week = "week"
    
    func stringValue() -> String {
        switch self {
        case .today:
            return "일일미션"
        case .week:
            return "주간미션"
        }
    }
}

enum missionType: String, CaseIterable {
    case none = "none"
    case water = "water"
    case food = "food"
    case electricity = "electricity"
    case recycle = "recycle"
    
    func stringValue() -> String {
        switch self {
        case .none:
            return "All"
        case .water:
            return "물 아껴쓰기"
        case .food:
            return "음식물 쓰래기 줄이기"
        case .electricity:
            return "전기 아껴쓰기"
        case .recycle:
            return "분리수거 잘하기"
        }
    }
}

struct Mission: Identifiable, Hashable{
    let id = UUID()
    let category: String // today, week
    let type: String // water, food, electricity, recycle
    let title: String
    let description: String
    var isCompleted: Bool
}
