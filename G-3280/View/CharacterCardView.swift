//
//  CharacterCardView.swift
//  G-3280
//
//  Created by ParkJun on 2023/05/03.
//

import SwiftUI

struct CharacterCardView: View {
    
    var cardData: Character
    
    var body: some View {
        VStack{
            HStack(alignment: .top) {
                VStack {
                    ForEach(Array(cardData.name), id: \.self) { letter in
                        Text(String(letter))
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                    }
                }
                .padding(.trailing, 10)
                
                VStack {
                    ForEach(Array(cardData.species), id: \.self) { letter in
                        Text(String(letter))
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                    }
                }
                .padding(.top, 6)
            }
            .padding(.leading, 160)
            .padding(.bottom, -10)
            
            Image(cardData.image)
                .resizable()
                .frame(width: 293, height: 317)
                .padding(.bottom, -20)
        }
        .frame(width: 282, height: 425)
        .background(cardData.backColor)
        .cornerRadius(15)
            
    }
}

//struct CharacterCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterCardView()
//    }
//}
