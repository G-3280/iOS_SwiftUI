//
//  SignUpViewModel.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/08.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

final class SignUpViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var nickname: String = ""
    @Published var errorMessage: String?
    @Published var signUpStatus: status = .signUp
    
    enum status {
        case signUp
        case isLoading
        case isSignUpCompleted
    }
    
    let db = Firestore.firestore()

    func signUp() async {
        do {
            await MainActor.run(body: {
                withAnimation(Animation.easeIn) {
                    self.signUpStatus = .isLoading
                }
            })
            
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            
            let userRef = db.collection("users").document("\(result.user.uid)")
            
            try await userRef.setData([
                "uid" : "\(result.user.uid)",
                "userEmail" : "\(email)",
                "userName" : "\(nickname)",
                "completedMission" : 0,
                "completedCard" : ["penguin", "redPanda", "marten"],
                "completedEvaluation" : 0,
                "nowCompletedMissionCount" : 0,
                "nowTotalMissionCount" : 0
            ])
            
            print(result.user)
            
            DispatchQueue.main.async {
                self.signUpStatus = .isSignUpCompleted
            }
        } catch {
            print("Failed to log in with error: \(error.localizedDescription)")
            
            await MainActor.run(body: {
                self.signUpStatus = .signUp
            })
        }
    }
}


import Firebase
import FirebaseFirestore

class UserViewModel: ObservableObject {
    // Firestore 인스턴스 생성
    let db = Firestore.firestore()

    func createCollection() {
        // 유저 문서 참조
        let userRef = db.collection("users").document("USER_ID")
        
        // 미션 문서 참조
        let missionRef = db.collection("missions").document("MISSION_ID")
        
        // 미션 문서에 유저 참조를 저장합니다.
        missionRef.setData([
            "userId": userRef,
            "title": "미션 제목",
            "description": "미션 설명"
            // 기타 필요한 정보
        ])
    }
}
