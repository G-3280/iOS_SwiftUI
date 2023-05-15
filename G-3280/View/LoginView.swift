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
    @State var stack: [Int] = []
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var userInfoViewModel: UserInfoViewModel
    
    var body: some View {
        NavigationStack(path: $stack) {
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
                            if authViewModel.isLoggedIn == true {
                                await userInfoViewModel.fetchUser()
                            }
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
                        
                        Button {
                            stack.append(1)
                        } label: {
                            Text("회원가입")
                                .foregroundColor(Color(hex: "B1B1B1"))
                        }
                        .navigationDestination(for: Int.self) { int in
                            SignUpView(stack: $stack)
                        }
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
