//
//  HomeView.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/01.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            TabView {
                ForEach(haveCharacterCard) { card in
                    CharacterCardView(cardData: card)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
