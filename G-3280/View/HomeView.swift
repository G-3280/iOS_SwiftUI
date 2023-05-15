//
//  HomeView.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/01.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var userInfoViewModel: UserInfoViewModel
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("안녕하세요!")
               
                Text("\(userInfoViewModel.user?.nickName ?? "")")
                    .font(.title3)
                    .fontWeight(.bold)
                +
                Text(" 님")
            }
            .padding(.horizontal, 30)
            .padding(.top, 16)
            
            
            VStack(alignment: .leading) {
                HStack {
                    Text("모은 캐릭터 카드")
                        .font(.title3)
                        .fontWeight(.bold)
                    +
                    Text("(\(userInfoViewModel.user?.completedCard.count ?? 0))")
                        .foregroundColor(.customInfoGray)
                }
                .padding(.horizontal, 30)
                
                TabView {
                    ForEach(haveCharacterCard) { card in
                        CharacterCardView(cardData: card)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
        }.redacted(reason: userInfoViewModel.isLoading ? .placeholder : [])
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
