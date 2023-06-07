//
//  MissionCompletedView.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/06/06.
//

import SwiftUI

struct MissionCompletedView: View {
    
    @Binding var stack: [Int]
    
    var body: some View {
        ZStack{
            Color.customBackGray
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("미션을")
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
                    Text("완료")
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
}
