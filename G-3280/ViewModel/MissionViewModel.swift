//
//  MissionViewModel.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/12.
//

import Foundation
import SwiftUI

class MissionViewModel: ObservableObject {
    @Published var nowMission: [Mission] = []
    
    init() {
        updateNowMissionForCategory(info: .today, category: .none)
    }
    
    func getCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "M월 dd일"
        return formatter.string(from: Date())
    }
    
    func updateNowMissionForCategory(info: missionInfo, category: missionCategory) {
        switch (info, category) {
        case (.today, .none):
            // 일일미션
            nowMission = missionData.filter { mission in
                mission.type == info.rawValue
            }
        case (.week, .none):
            // 주간 미션
            nowMission = missionData.filter { mission in
                mission.type == info.rawValue
            }
        case (.today, .water):
            // 물 아껴쓰기 미션 중 오늘 수행해야 할 미션들
            nowMission = missionData.filter { mission in
                mission.category == category.rawValue && mission.type == info.rawValue
            }
        case (.week, .water):
            // 물 아껴쓰기 미션 중 주간 수행해야 할 미션들
            nowMission = missionData.filter { mission in
                mission.category == category.rawValue && mission.type == info.rawValue
            }
        case (.today, .food):
            // 음식물 쓰래기 줄이기 미션 중 오늘 수행해야 할 미션들
            nowMission = missionData.filter { mission in
                mission.category == category.rawValue && mission.type == info.rawValue
            }
        case (.week, .food):
            // 음식물 쓰래기 줄이기 미션 중 주간 수행해야 할 미션들
            nowMission = missionData.filter { mission in
                mission.category == category.rawValue && mission.type == info.rawValue
            }
        case (.today, .electricity):
            // 전기 아껴쓰기 미션 중 오늘 수행해야 할 미션들
            nowMission = missionData.filter { mission in
                mission.category == category.rawValue && mission.type == info.rawValue
            }
        case (.week, .electricity):
            // 전기 아껴쓰기 미션 중 주간 수행해야 할 미션들
            nowMission = missionData.filter { mission in
                mission.category == category.rawValue && mission.type == info.rawValue
            }
        case (.today, .recycle):
            // 분리수거 잘하기 미션 중 오늘 수행해야 할 미션들
            nowMission = missionData.filter { mission in
                mission.category == category.rawValue && mission.type == info.rawValue
            }
        case (.week, .recycle):
            // 분리수거 잘하기 미션 중 주간 수행해야 할 미션들
            nowMission = missionData.filter { mission in
                mission.category == category.rawValue && mission.type == info.rawValue
            }
        }
    }
//    func updateMissionData(info: missionInfo, category: missionCategory) {
//        let missions = missionData.filter{ $0.type == info.stringValue() && $0.category == category.rawValue }
//        self.nowMission = missions
//    }
    
//    func getCategoryMissionData(category: String) -> [Mission] {
//        let missions = missionData.filter { $0.category == category }
//        return missions
//    }
}
