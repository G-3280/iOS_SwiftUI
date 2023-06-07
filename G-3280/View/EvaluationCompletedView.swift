//
//  EvaluationCompletedView.swift
//  G-3280
//
//  Created by HYELYN KANG on 2023/06/07.
//

import SwiftUI

struct EvaluationCompletedView: View{
    @State private var count: Int = 0
    var body: some View{
        ZStack{
            Color.customBackGray
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text("평가를\n완료했습니다!")
                    .font(.title)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .bold()
                Spacer()
                Button("완료") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .foregroundColor(.black)
                    .background(Rectangle()
                    .frame(width: 300.0, height: 65.0)
                    .foregroundColor(Color(hex: "9AEDA5"))
                    .cornerRadius(20))
                    .padding()
            }
        }
    }
}

struct EvaluationCompletedView_Previews: PreviewProvider {
    static var previews: some View {
        EvaluationCompletedView()
    }
}
