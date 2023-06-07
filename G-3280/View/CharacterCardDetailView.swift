//
//  CharacterCardDetailView.swift
//  G-3280
//
//  Created by HYELYN KANG on 2023/05/31.
//

import SwiftUI

struct CharacterCardDetailView: View {
    
    var cardData: Character
    
    var body: some View {
        ZStack{
            Color.customBackGray
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image(cardData.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                ForEach(Array(cardData.species), id: \.self){ letter in
                    Text(String(letter))
                        .font(.subheadline)
                }
                ForEach(Array(cardData.name), id: \.self){ letter in
                    Text(String(letter))
                        .font(.title)
                        .bold()
                }
                
                Spacer()
                
                ForEach(Array(cardData.explanation), id: \.self){ letter in
                    ScrollView{
                        Text(String(letter))
                            .padding()
                    }
                }
                .background(Rectangle()                    .foregroundColor(Color(hex: "F5F5F5"))
                .cornerRadius(20))
                .padding()
            }
//            NavigationView{
//                NavigationLink("카드눌러"){
//                    VStack{
//                        Image(cardData.image)
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//
//                        Spacer()
//                        ForEach(Array(cardData.species), id: \.self){ letter in
//                            Text(String(letter))
//                                .font(.subheadline)
//                        }
//                        ForEach(Array(cardData.name), id: \.self){ letter in
//                            Text(String(letter))
//                                .font(.title)
//                                .bold()
//                        }
//
//                        Spacer()
//
//                        ForEach(Array(cardData.explanation), id: \.self){ letter in
//                            ScrollView{
//                                Text(String(letter))
//                                    .padding()
//                            }
//                        }
//                        .background(Rectangle()                    .foregroundColor(Color(hex: "F5F5F5"))
//                        .cornerRadius(20))
//                        .padding()
//                    }
//                }
//            }
        }
    }
}


struct CharacterCardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCardDetailView(cardData: .penguin)

    }
}
