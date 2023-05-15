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
    
    var body: some View {
//        MainView()
        ZStack {
            Color.customBackGray
                .edgesIgnoringSafeArea(.all)
            VStack{
                if viewModel.isLoggedIn {
                    MainView()
                } else {
                    LoginView()
                }
            }
        }
        .onAppear {
            if Auth.auth().currentUser != nil && Auth.auth().currentUser?.uid == viewModel.userUid {
                viewModel.isLoggedIn = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
