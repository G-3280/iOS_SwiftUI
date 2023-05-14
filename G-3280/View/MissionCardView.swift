//
//  MissionCardView.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/05/12.
//

import SwiftUI

struct MissionCardView: View {
    
    var cardData: Mission
    
    var body: some View {
        HStack(alignment: .center, spacing: 50) {
            VStack(alignment: .leading) {
                HStack{
                    Image("seleted_\(cardData.category)")
                        .resizable()
                        .frame(width:20, height: 20)
                    
                    Text("물 아껴쓰기")
                        .foregroundColor(.customMissionGray)
                        .font(.subheadline)
                }
                
                Text(cardData.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    
            }
            
            if cardData.isCompleted {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .foregroundColor(.customMissionGreen)
                    .frame(width: 40, height: 40)
            } else {
                Spacer()
                    .frame(width: 40, height: 40)
            }
            
        }
        .frame(width: 341, height: 87)
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct MissionCardView_Previews: PreviewProvider {
    static var previews: some View {
        MissionCardView(cardData: missionData[1])
    }
}
