//
//  InEvaluationView.swift
//  G-3280
//
//  Created by HYELYN KANG on 2023/06/07.
//

import SwiftUI

struct InEvaluationView: View{
    @State private var count: Int = 0
    var body: some View{
        ZStack{
            Color.customBackGray
                .ignoresSafeArea()
            VStack{
                HStack{
                    Image(systemName:"chevron.backward")
                    Text("평가")
                }.foregroundColor(Color("ButtonColor"))
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                HStack{
                    Text("물 아껴쓰기")
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .padding(.leading) //추후 수정. 미션 db에서 불러와야 하나
                    Spacer()
                }
                Image("redFox")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("평가완료")
                Text("2/5") //이것도 추후 수정
                Spacer()
                HStack(spacing:70){
                    Button("참 잘했어요!") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }.background(Rectangle()
                        .frame(width: 150.0, height: 80.0)
                        .foregroundColor(Color(hex: "9AEDA5"))
                        .cornerRadius(20))
                    .padding(.trailing)
                    
                    Button("분발하세요!") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }.background(Rectangle()
                        .frame(width: 150.0, height: 80.0)
                        .foregroundColor(Color(hex: "02956D"))
                        .cornerRadius(20))
                    .padding(.leading)
                }
                Spacer()
            }
        }
    }
}

struct InEvaluationView_Previews: PreviewProvider {
    static var previews: some View {
        InEvaluationView()
    }
}
