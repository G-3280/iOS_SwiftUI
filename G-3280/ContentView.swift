//
//  ContentView.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/04/30.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @EnvironmentObject var viewModel : AuthViewModel
    @StateObject var userInfoViewModel: UserInfoViewModel = UserInfoViewModel()
    
    var body: some View {
        ZStack {
            Color.customBackGray
                .edgesIgnoringSafeArea(.all)
            VStack{
                if viewModel.isLoggedIn {
                    MainView()
                        .environmentObject(userInfoViewModel)
                } else {
                    LoginView()
                        .environmentObject(userInfoViewModel)
                }
            }
        }
        .onAppear {
            if Auth.auth().currentUser != nil && Auth.auth().currentUser?.uid == viewModel.userUid {
                viewModel.isLoggedIn = true
                Task {
                    await userInfoViewModel.fetchUser()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewModel())
    }
}
