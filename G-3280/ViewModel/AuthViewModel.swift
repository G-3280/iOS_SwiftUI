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
    
    func loginFirebase(email: String, password: String) async {
        do {
            try await Auth.auth().signIn(withEmail: email, password: password)
            await MainActor.run(body: {
                print("성공")
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
    
}
