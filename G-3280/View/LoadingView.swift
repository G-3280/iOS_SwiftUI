//
//  LoadingView.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/05.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.customBackGray
                .edgesIgnoringSafeArea(.all)
            LottieView(lottieFile: "Loading", loopMode: .loop)
                .frame(width:300, height: 300)
                .toolbar(.hidden)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
