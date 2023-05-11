//
//  SignUpView.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/05.
//

import SwiftUI

struct SignUpView: View {
    
    enum Field {
        case userId
        case userPw
        case userCheckPw
        case userNickName
    }
    
    @StateObject private var viewModel = SignUpViewModel()
    @FocusState private var focusedField: Field?
    @Binding var stack: [Int]
    
    var body: some View {
        switch viewModel.signUpStatus {
            case .signUp: content
            case .isLoading: LoadingView()
                .transition(.move(edge: .trailing))
            case .isSignUpCompleted: CompletedView(stack: $stack)
        }
    }
    
    @ViewBuilder
        private var content: some View {
            ZStack {
                Color.customBackGray
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    VStack(alignment: .leading) {
                        
                        Text("아이디")
                            .fontWeight(.bold)
                        VStack {
                            TextField("아이디를 입력하세요", text: $viewModel.email)
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
                            SecureField("비밀번호를 입력하세요", text: $viewModel.password)
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
                            SecureField("비밀번호 확인을 위해 다시 입력하세요", text: $viewModel.confirmPassword)
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
                            TextField("사용할 닉네임을 입력하세요", text: $viewModel.nickname)
                                .focused($focusedField, equals: .userNickName)
                            
                            Divider()
                                .frame(minHeight: 2)
                                .background(focusedField == .userNickName ? Color.customGreen : nil)
                                .padding(.trailing, 34)
                        }
                        
                        Spacer()
                        
                    }
                    .padding([.leading, .top], 34)
                    
                    Button(action: {
                        Task {
                            await viewModel.signUp()
                        }
                    }){
                        Text("가입하기")
                            .foregroundColor(.white)
                            .font(.title3)
                            .fontWeight(.bold)
                            .frame(width: 353, height: 53)
                            .background(Color.customGreen)
                            .cornerRadius(15)
                    }
                    .padding(.bottom, 20)
                }
                .navigationTitle("회원가입")
            }
        }
}

//struct SignUpView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUpView()
//    }
//}
