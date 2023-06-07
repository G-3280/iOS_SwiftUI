//
//  MissionViewModel.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/12.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage

class MissionViewModel: ObservableObject {
    @Published var nowMission: [Mission] = []
    @Published var isLoading: Bool = true
    @Published var image: UIImage?
    @Published var isImageUpLoading: Bool = false
    @Published var stack: [Int] = []
    
    @Published var selectedImage: UIImage? {
        didSet {
            handleSelectedImageChange()
        }
    }
    
    var firebaseMissionData: [Mission] = []
    var selectedMissionDocumentID: String = ""
    
    let db = Firestore.firestore()

    init() {
        Task {
            await fetchMissions()
        }
        updateNowMissionForCategory(category: .today, type: .none)
        print("초기화")
    }
    
    func handleSelectedImageChange() {
        Task {
            await uploadImage()
        }
    }
    
    /// 인증하려는 미션에 사진 정보 올리기
    func saveImageUrlToFirestore(documentID: String, uid: String, imageUrl: URL) async throws {
        let db = Firestore.firestore()
        let documentRef = db.collection("missionTest").document(documentID)
        let usersCollectionRef = documentRef.collection("users")
        let userDocumentRef = usersCollectionRef.document(uid)
        
        do {
            try await userDocumentRef.setData(["imageUrl": imageUrl.absoluteString, "isCompleted": true], merge: true)
            print("Image URL saved successfully")
        } catch {
            throw error
        }
    }
    
    /// Firebase Storage 에 사진 올리기
    func uploadImage() async {
        
        guard let userUid = UserDefaults.standard.string(forKey: "user_uid"), !userUid.isEmpty else {
            print("User UID is empty.")
            return
        }
        
        guard let image = selectedImage else { return print("사진없음")
            await UITabBar.toogleTabBarVisibility()
            
//            await MainActor.run(body: {
//                UITabBar.toogleTabBarVisibility()
////                UITabBar.showTabBar(animated: false)
//            })
        }
        
        stack.append(1)
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let storageRef = Storage.storage().reference().child("\(userUid).jpg")
        
        do {
            try await storageRef.putData(imageData)
            let downloadURL = try await storageRef.downloadURL()
            
            try await saveImageUrlToFirestore(documentID: selectedMissionDocumentID, uid: userUid, imageUrl: downloadURL)
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                
                self.isImageUpLoading = true
            }
            
            print("Image uploaded successfully.")
        } catch {
            print("Error uploading image: \(error.localizedDescription)")
        }

    }
    
    /// FireStore의 mission 컬렉션에 user_uid 가 있는 미션 데이터를 불러옵니다
    func fetchMissions() async {
        
        firebaseMissionData.removeAll()
        
        guard let userUid = UserDefaults.standard.string(forKey: "user_uid"), !userUid.isEmpty else {
            print("User UID is empty.")
            return
        }
        
        do {
            let missionDocuments = try await db.collection("missionTest").getDocuments()
            
            for missionDocument in missionDocuments.documents {
                let userDocumentReference = missionDocument.reference.collection("users").document(userUid)
                let userDocument = try await userDocumentReference.getDocument()
                
                guard userDocument.exists else { continue }
                
                let userData = userDocument.data()
                
                let mission = Mission(documentID: missionDocument.documentID, category: missionDocument.get("category") as? String ?? "", type: missionDocument.get("type") as? String ?? "", title: missionDocument.get("title") as? String ?? "", description: missionDocument.get("description") as? String ?? "", isCompleted: userData?["isCompleted"] as? Bool ?? false)
                
                self.firebaseMissionData.append(mission)
                
                
                await MainActor.run(body: {
                    self.nowMission = self.firebaseMissionData.filter {
                        $0.category == "today"
                    }
                })
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.isLoading = false
                }
            }
        } catch {
            print("Error occurred while fetching missions: \(error)")
        }
    }
    
    /// 상단에 위치한 현재 날짜보여주기 위해 시간을 받아오는 함수
    func getCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "M월 dd일"
        return formatter.string(from: Date())
    }
    
    /// 유저가 선택한 미션 카테고리로 정렬
    func updateNowMissionForCategory(category: missionCategory, type: missionType) {
        switch (category, type) {
        case (.today, .none):
            // 일일미션
            nowMission = firebaseMissionData.filter { mission in
                mission.category == category.rawValue
            }
        case (.week, .none):
            // 주간 미션
            nowMission = firebaseMissionData.filter { mission in
                mission.category == category.rawValue
            }
        case (.today, .water):
            // 물 아껴쓰기 미션 중 오늘 수행해야 할 미션들
            nowMission = firebaseMissionData.filter { mission in
                mission.type == type.rawValue && mission.category == category.rawValue
            }
        case (.week, .water):
            // 물 아껴쓰기 미션 중 주간 수행해야 할 미션들
            nowMission = firebaseMissionData.filter { mission in
                mission.type == type.rawValue && mission.category == category.rawValue
            }
        case (.today, .food):
            // 음식물 쓰래기 줄이기 미션 중 오늘 수행해야 할 미션들
            nowMission = firebaseMissionData.filter { mission in
                mission.type == type.rawValue && mission.category == category.rawValue
            }
        case (.week, .food):
            // 음식물 쓰래기 줄이기 미션 중 주간 수행해야 할 미션들
            nowMission = firebaseMissionData.filter { mission in
                mission.type == type.rawValue && mission.category == category.rawValue
            }
        case (.today, .electricity):
            // 전기 아껴쓰기 미션 중 오늘 수행해야 할 미션들
            nowMission = firebaseMissionData.filter { mission in
                mission.type == type.rawValue && mission.category == category.rawValue
            }
        case (.week, .electricity):
            // 전기 아껴쓰기 미션 중 주간 수행해야 할 미션들
            nowMission = firebaseMissionData.filter { mission in
                mission.type == type.rawValue && mission.category == category.rawValue
            }
        case (.today, .recycle):
            // 분리수거 잘하기 미션 중 오늘 수행해야 할 미션들
            nowMission = firebaseMissionData.filter { mission in
                mission.type == type.rawValue && mission.category == category.rawValue
            }
        case (.week, .recycle):
            // 분리수거 잘하기 미션 중 주간 수행해야 할 미션들
            nowMission = firebaseMissionData.filter { mission in
                mission.type == type.rawValue && mission.category == category.rawValue
            }
        }
    }
}
