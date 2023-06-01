//
//  UserViewModel.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/15.
//

import Foundation
import FirebaseFirestore

class UserInfoViewModel: ObservableObject {
    @Published var user: UserModel?
    @Published var isLoading: Bool = false
    
    
    private var db = Firestore.firestore()

    func fetchUser() async {
        
        let defaults = UserDefaults.standard
        
        guard let userUid = defaults.string(forKey: "user_uid"), !userUid.isEmpty else {
            print("User UID is empty.")
            return
        }
        
        do {
            await MainActor.run(body: {
                self.isLoading = true
            })

            let documentSnapshot = try await db.collection("users").document(userUid).getDocument()
            
            if let data = documentSnapshot.data(), let user = UserModel(data: data) {
                
                await MainActor.run(body: {
                    self.user = user
                })
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.isLoading = false
                }
            }
            
        } catch {
            print("Error getting user: \(error.localizedDescription)")
        }


//        db.collection("users").document(userUid).getDocument { (documentSnapshot, error) in
//            if let error = error {
//                print("Error getting user: \(error.localizedDescription)")
//                return
//            }
//
//            if let document = documentSnapshot, document.exists {
//                self.user = try? document.data(as: UserModel.self)
//            }
//        }
    }
}
