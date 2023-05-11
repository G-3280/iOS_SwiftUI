//
//  SignUpViewModel.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/08.
//

import SwiftUI
import FirebaseAuth

class SignUpViewModel: ObservableObject {
    
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

    func signUp() async {
        do {
            await MainActor.run(body: {
                withAnimation(Animation.easeIn) {
                    self.signUpStatus = .isLoading
                }
            })
            
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            
            print(result.user)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
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
