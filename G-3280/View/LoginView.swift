//
//  LoginView.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/04.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Rectangle()
                
                HStack(spacing: 43) {
                    NavigationLink("아이디 찾기") {
                        EmptyView()
                    }.foregroundColor(Color(hex: "B1B1B1"))
                    
                    Divider()
                        .foregroundColor(Color(hex: "DBD9D9"))
                        .frame(height: 27)
                    
                    NavigationLink("회원가입") {
                        SignUpView()
                    }.foregroundColor(Color(hex: "B1B1B1"))
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
