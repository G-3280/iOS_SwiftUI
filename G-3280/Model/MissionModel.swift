//
//  MissionModel.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/12.
//

import Foundation

struct Mission: Identifiable {
    let id = UUID()
    let type: String
    let category: String
    let name: String
    var isCompleted: Bool
}

let missionData: [Mission] = [Mission(type: "today", category: "water", name: "양치컵에 물을 받아서 양치해요!", isCompleted: true),
                              Mission(type: "weak", category: "food", name: "양치컵에 물을 받아서 양치해요!", isCompleted: false),
                              Mission(type: "today", category: "electricity", name: "양치컵에 물을 받아서 양치해요!", isCompleted: false),
                              Mission(type: "weak", category: "water", name: "양치컵에 물을 받아서 양치해요!", isCompleted: false),
                              Mission(type: "today", category: "food", name: "양치컵에 물을 받아서 양치해요!", isCompleted: false)]
