//
//  SettingView.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/01.
//

import SwiftUI

struct SettingView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
//
//        }.toolbar {
//            Text("\(viewModel.email) 님")
//
//            Spacer()
//
//            Button("로그아웃") {
//                Task {
//                    await viewModel.logoutFirebase()
//                }
//            }
//        }
//        .onAppear {
//            print(viewModel.isLoggedIn)
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
