//
//  EvaluationView.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/01.
//

import SwiftUI

struct EvaluationView: View {
    
    var body: some View {
        NavigationView{
            VStack{
                Image("redFox")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("다른 사람들의\n친환경 행동을 평가하러가요!")
                    .font(.title)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .bold()
                NavigationLink(destination: InEvaluationView()) {
                    Text("시작하기")
                }.buttonStyle(.bordered)
//                Button(action: }){
//                    Text("시작하기")
//                }.buttonStyle(.bordered)
                //TabView
            }
        }
    }
}

struct EvaluationView_Previews: PreviewProvider {
    static var previews: some View {
        EvaluationView()
    }
}
