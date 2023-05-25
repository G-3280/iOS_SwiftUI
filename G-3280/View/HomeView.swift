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
        ZStack {
            Color.customBackGray
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                VStack {
                    Text("안녕하세요!")
                        .font(.system(size: 20))
                    
                    HStack {
                        Text("\(userInfoViewModel.user?.nickName ?? "")")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                        
                        Text(" 님")
                            .font(.system(size: 20))
                            .padding(.top, 6)
                    }
                    .padding(.top, -5)
                    .padding(.leading, -5)
                }
                .padding(.horizontal, 30)
                .padding(.top, 16)
                
                ZStack(alignment: .leading) {
                    VStack {
                        HStack {
                            Text("모은 캐릭터 카드")
                                .font(.title3)
                                .fontWeight(.bold)
                            +
                            Text(" (\(userInfoViewModel.user?.completedCard.count ?? 0))")
                                .foregroundColor(.customMissionGray)
                        }
                        .padding(.horizontal, 30)
                        .padding(.top, 30)
                        
                        Spacer()
                    }
                    
                    if let userCard = userInfoViewModel.user?.completedCard {
                        cardsTabView(cards: userCard)
                    } else {
                        Text("카드를 찾을 수 없습니다.")
                    }
                }
            }.redacted(reason: userInfoViewModel.isLoading ? .placeholder : [])
        }
    }
    
    private func cardsTabView(cards: [String]) -> some View {
        TabView {
            ForEach(cards, id: \.self) { imageName in
                if let character = Character(imageName: imageName) {
                    CharacterCardView(cardData: character)
                }
            }.onAppear{
                print(cards)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
