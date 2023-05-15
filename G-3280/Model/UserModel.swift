//
//  UserModel.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/15.
//

import Foundation

//struct UserModel {
//    let uid: String
//    var nickName: String
//    var completedMission: Int
//    var completedCard: [String]
//    var completedEvaluation: Int
//}

struct UserModel: Identifiable, Codable {

    let id : String?
    var uid: String
    var userEmail: String
    var nickName: String
    var completedMission: Int
    var completedCard: [String]
    var completedEvaluation: Int
    // 필요한 다른 필드를 여기에 추가하세요.

    init?(id: String? = nil, data: [String: Any]) {
        guard let uid = data["uid"] as? String,
            let userEmail = data["userEmail"] as? String,
            let nickName = data["userName"] as? String,
            let completedMission = data["completedMission"] as? Int,
            let completedCard = data["completedCard"] as? [String],
            let completedEvaluation = data["completedEvaluation"] as? Int
        else {
            return nil
        }
        
        self.id = id
        self.uid = uid
        self.userEmail = userEmail
        self.nickName = nickName
        self.completedMission = completedMission
        self.completedCard = completedCard
        self.completedEvaluation = completedEvaluation
    }
}
