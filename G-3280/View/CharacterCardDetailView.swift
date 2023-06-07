//
//  CharacterCardDetailView.swift
//  G-3280
//
//  Created by HYELYN KANG on 2023/05/31.
//

import SwiftUI

struct CharacterCardDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    var cardData: Character
    
    var body: some View {
        ZStack{
            Color.customBackGray
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack{
                    Image(cardData.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    
                    Text(cardData.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    
                    VStack(alignment: .leading) {
                        
                        Text(cardData.species)
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding()
                        
                        Text(cardData.explanation)
                            .padding()
                            
                    }
                    .background {
                        Rectangle()
                            .foregroundColor(Color(hex: "F5F5F5"))
                            .cornerRadius(20)
                    }
                    
                }
                .padding()
                    
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                    Text("홈")
                }
            }
        }
    }
}


struct CharacterCardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCardDetailView(cardData: .redFox)

    }
}
