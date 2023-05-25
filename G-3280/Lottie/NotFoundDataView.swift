//
//  notFoundDataView.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/25.
//

import SwiftUI

struct NotFoundDataView: View {
    var body: some View {
        ZStack {
            Color.customBackGray
                .edgesIgnoringSafeArea(.all)
            VStack {
                LottieView(lottieFile: "NotFoundData", loopMode: .loop, speed: 1.8)
                    .frame(width:200, height: 200)
                    .toolbar(.hidden)
                
                Text("해당하는 미션이 없어요!")
                    .font(.headline)
            }
        }
    }
}

struct notFoundDataView_Previews: PreviewProvider {
    static var previews: some View {
        NotFoundDataView()
    }
}
