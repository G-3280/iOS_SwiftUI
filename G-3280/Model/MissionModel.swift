//
//  MissionModel.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/12.
//

import Foundation

enum missionInfo: String, CaseIterable {
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

enum missionCategory: String, CaseIterable {
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
    let type: String
    let category: String
    let name: String
    var isCompleted: Bool
}

let missionData: [Mission] = [Mission(type: "today", category: "water", name: "양치컵에 물을 받아서 양치해요!", isCompleted: true),
                              Mission(type: "week", category: "food", name: "양치컵에 물을 받아서 양치해요!", isCompleted: false),
                              Mission(type: "today", category: "electricity", name: "양치컵에 물을 받아서 양치해요!", isCompleted: false),
                              Mission(type: "week", category: "water", name: "양치컵에 물을 받아서 양치해요!", isCompleted: false),
                              Mission(type: "today", category: "food", name: "양치컵에 물을 받아서 양치해요!", isCompleted: false)]
