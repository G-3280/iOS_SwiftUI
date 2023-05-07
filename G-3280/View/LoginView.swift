//
//  LoginView.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/05.
//

import SwiftUI

struct LoginView: View {
    
    enum Field {
        case userId
        case userPw
    }
    
    @State private var loginId = ""
    @State private var loginPw = ""
    @FocusState private var focusedField: Field?
    @State private var isLogin = false
    
    @StateObject private var authViewModel: AuthViewModel = AuthViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.customBackGray
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Rectangle()
                        .fill(Color.customGray)
                        .frame(width: UIScreen.main.bounds.width - 90, height: 300)
                        .padding()
                    
                    Spacer()
                    
                    VStack {
                        TextField("아이디를 입력하세요", text: $loginId)
                            .focused($focusedField, equals: .userId)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(focusedField == .userId ? Color.customGreen : Color.customGray, lineWidth: 2)
                                    .frame(width: UIScreen.main.bounds.width - 90, height: 45)
                            )
                            .frame(width: UIScreen.main.bounds.width - 90, height: 45)
                            .padding(.bottom, 3)
                        
                        
                        SecureField("비밀번호를 입력하세요", text: $loginPw)
                            .focused($focusedField, equals: .userPw)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(focusedField == .userPw ? Color.customGreen : Color.customGray, lineWidth: 2)
                                    .frame(width: UIScreen.main.bounds.width - 90, height: 45)
                            )
                            .frame(width: UIScreen.main.bounds.width - 90, height: 45)
                    }
                    .padding(.bottom, 24)
                    
                    Button(action: {
                        Task {
                            await authViewModel.loginFirebase(email: loginId, password: loginPw)
                        }
                    }){
                        Text("로그인")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .frame(width: UIScreen.main.bounds.width - 90, height: 53)
                            .background(Color.customGreen)
                            .cornerRadius(15)
                    }
                    .padding(.bottom, 20)
                    
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
                    .padding(.trailing, 10)
                    
                    Spacer()
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
