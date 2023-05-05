//
//  SignUpView.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/04.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var signUpId = ""
    @State private var signUpPw = ""
    @State private var signUpCheckPw = ""
    @State private var signUpNickName = ""
    @FocusState private var focusedField: Field?
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                
                Text("아이디")
                    .fontWeight(.bold)
                VStack {
                    TextField("아이디를 입력하세요", text: $signUpId)
                        .focused($focusedField, equals: .userId)
                    
                    Divider()
                        .frame(minHeight: 2)
                        .background(focusedField == .userId ? Color.customGreen : nil)
                        .padding(.trailing, 34)
                }
                .padding(.bottom, 29)
                
                Text("비밀번호")
                    .fontWeight(.bold)
                VStack {
                    SecureField("비밀번호를 입력하세요", text: $signUpPw)
                        .focused($focusedField, equals: .userPw)
                    
                    Divider()
                        .frame(minHeight: 2)
                        .background(focusedField == .userPw ? Color.customGreen : nil)
                        .padding(.trailing, 34)
                }
                .padding(.bottom, 29)
                
                Text("비밀번호 확인")
                    .fontWeight(.bold)
                VStack {
                    SecureField("비밀번호 확인을 위해 다시 입력하세요", text: $signUpCheckPw)
                        .focused($focusedField, equals: .userCheckPw)
                    
                    Divider()
                        .frame(minHeight: 2)
                        .background(focusedField == .userCheckPw ? Color.customGreen : nil)
                        .padding(.trailing, 34)
                }
                .padding(.bottom, 29)
                
                Text("닉네임")
                    .fontWeight(.bold)
                VStack {
                    TextField("사용할 닉네임을 입력하세요", text: $signUpNickName)
                        .focused($focusedField, equals: .userNickName)
                    
                    Divider()
                        .frame(minHeight: 2)
                        .background(focusedField == .userNickName ? Color.customGreen : nil)
                        .padding(.trailing, 34)
                }
                
                Spacer()
                
            }
            .padding([.leading, .top], 34)
            
            NavigationLink {
                
            } label: {
                Text("가입하기")
                    .foregroundColor(.white)
                    .frame(width: 353, height: 53)
                    .background(Color(hex: "34E18B"))
                    .cornerRadius(15)
            }
        }
        .navigationTitle("회원가입")
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

enum Field {
    case userId
    case userPw
    case userCheckPw
    case userNickName
}
