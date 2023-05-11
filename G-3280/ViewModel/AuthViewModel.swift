//
//  LoginViewModel.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/07.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoggedIn = false
    @AppStorage("user_uid") var userUid: String = ""
    
    
    func loginFirebase(email: String, password: String) async {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            await MainActor.run(body: {
                print("성공")
                self.userUid = result.user.uid
                print(userUid)
                withAnimation(.easeInOut) { self.isLoggedIn = true }
            })
        } catch {
            print("Failed to log in with error: \(error.localizedDescription)")
            await MainActor.run(body: {
                print("실패")
                withAnimation(.easeInOut) { self.isLoggedIn = false }
            })
        }
    }
    
    func logoutFirebase() async {
        do {
            try Auth.auth().signOut()
            await MainActor.run(body: {
                self.isLoggedIn = false
            })
        } catch {
            print("Failed to log in with error: \(error.localizedDescription)")
        }
    }
}
