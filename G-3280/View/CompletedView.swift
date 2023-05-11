//
//  CompletedView.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/10.
//

import SwiftUI

struct CompletedView: View {
    
    @Binding var stack: [Int]
    
    var body: some View {
        VStack{
            Text("회원가입을")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 210)

            Text("완료했습니다!")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, -5)
            
            Spacer()
            
            Button {
                stack = .init()
            } label: {
                Text("로그인 하러가기")
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(width: 353, height: 53)
                    .background(Color.customGreen)
                    .cornerRadius(15)
            }
            .padding(.bottom, 20)
        }
        .toolbar(.hidden)
    }
}

//struct CompletedView_Previews: PreviewProvider {
//    static var previews: some View {
//        CompletedView()
//    }
//}


